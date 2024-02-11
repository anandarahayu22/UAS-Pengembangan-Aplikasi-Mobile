import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pos_bfc/controllers/cart_controller.dart';
import 'package:pos_bfc/controllers/transaction_controller.dart';
import 'package:pos_bfc/models/cart_model.dart';
import 'package:pos_bfc/models/transaction_model.dart';
import 'package:pos_bfc/utils/rupiah.dart';

class ItemTransaction extends StatelessWidget {
  const ItemTransaction({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionController());
    return SizedBox(
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "${transactionModel.image!}",
                  width: 90,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/placeholder.png",
                      width: 90,
                      height: 80,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(transactionModel.name!,
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          "x${transactionModel.quantity!}",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.black),
                onPressed: () {
                  controller.deleteTransactionItem(transactionModel.id!);
                  controller.getTransactionItems();
                }),
          ],
        )),
      ),
    );
  }
}
