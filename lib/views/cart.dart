import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pos_bfc/bottom_navigation_app.dart';
import 'package:pos_bfc/controllers/cart_controller.dart';
import 'package:pos_bfc/controllers/transaction_controller.dart';
import 'package:pos_bfc/models/transaction_model.dart';
import 'package:pos_bfc/utils/rupiah.dart';
import 'package:pos_bfc/views/item_cart.dart';
import 'package:pos_bfc/views/riwayat.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartC = Get.put(CartController());
    final transactionC = Get.put(TransactionController());
    cartC.getCartItems();
    cartC.getItemSubtotal();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 0, 0),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        title: Text(
          "Transaksi",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => cartC.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(20),
                child: cartC.cartItems.isEmpty
                    ? const Center(
                        child: Text(
                          'Tidak ada pembelian',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: cartC.cartItems.length,
                        itemBuilder: (context, index) {
                          var itemCart = cartC.cartItems[index];
                          return ItemCart(
                            cartModel: itemCart,
                            itemQuantity: itemCart.quantity!,
                          );
                        })),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.all(10),
        color: Colors.yellow,
        height: 140,
        child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Total pembayaran:",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  RupiahUtils.beRupiah(cartC.subtotal.toInt()),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    var listOrders = <TransactionModel>[];

                    late bool paymentSuccess;

                    for (var order in cartC.cartItems.value) {
                      transactionC
                          .addToTransaction(TransactionModel(
                        id: order.id,
                        name: order.name,
                        price: order.price,
                        quantity: order.quantity,
                        image: '${order.image}',
                        subtotalPerItem: cartC.subtotal.toInt(),
                      ))
                          .then((value) {
                        log("valueeess = $value");
                        paymentSuccess = value;
                        log("paymentSuccess = $paymentSuccess");
                      });
                      log(""" ORDER
                            id: ${order.id},
                            name: ${order.name},
                            price: ${order.price},
                            quantity: ${order.quantity},
                            image: 'assets/${order.image}',
                            subtotalPerItem: ${order.subtotalPerItem},
""");
                    }
                    cartC.deleteAllData();
                    cartC.setDefaultSubTotal();

                    Get.back();
                    Get.snackbar("Pembayaran berhasil", "Terima kasih!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(370, 50),
                  ),
                  child: Text(
                    "Bayar",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
