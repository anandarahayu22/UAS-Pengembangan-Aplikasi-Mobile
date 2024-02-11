import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pos_bfc/controllers/cart_controller.dart';
import 'package:pos_bfc/models/cart_model.dart';
import 'package:pos_bfc/utils/rupiah.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    Key? key,
    required this.cartModel,
    required this.itemQuantity,
  }) : super(key: key);

  final CartModel cartModel;
  final int itemQuantity;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
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
                  "${cartModel.image!}",
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
                      Text(cartModel.name!,
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      Text(
                        "Rp. ${cartModel.price!}",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      Row(children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.remove,
                            color: Colors.black,
                          ),
                          onTap: () {
                            itemQuantity == 1
                                ? controller.deleteCartItem(cartModel.id!)
                                : controller.decreaseQuantity(cartModel);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(itemQuantity.toString()),
                        ),
                        GestureDetector(
                            child: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            onTap: () {
                              controller.increaseQuantity(cartModel);
                            }),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.black),
                onPressed: () {
                  controller.deleteCartItem(cartModel.id!);
                }),
          ],
        )),
      ),
    );
  }
}
