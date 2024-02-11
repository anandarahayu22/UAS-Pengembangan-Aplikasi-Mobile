import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:pos_bfc/component/item_riwayat.dart';
import 'package:pos_bfc/controllers/transaction_controller.dart';
import 'package:pos_bfc/views/item_cart.dart';

class RiwayatView extends StatelessWidget {
  const RiwayatView({Key? key});

  @override
  Widget build(BuildContext context) {
    final transactionC = Get.put(TransactionController());
    transactionC.getTransactionItems();
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Penjualan'),
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color.fromARGB(255, 158, 0, 0),
      body: Obx(
        () => transactionC.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: transactionC.transactionItems.isEmpty
                    ? const Center(
                        child: Text(
                          'Tidak ada riwayat penjualan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: transactionC.transactionItems.length,
                        itemBuilder: (context, index) {
                          var itemTransaction =
                              transactionC.transactionItems[index];
                          return ItemTransaction(
                            transactionModel: itemTransaction,
                          );
                        })),
      ),
    );
  }
}
