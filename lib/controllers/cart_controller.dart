import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos_bfc/models/cart_model.dart';
import 'package:pos_bfc/utils/cart_database.dart';
import 'package:pos_bfc/models/transaction_model.dart';

class CartController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<CartModel> cartItems = <CartModel>[].obs;
  RxDouble subtotal = 0.0.obs;
  RxDouble total = 0.0.obs;

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }

  Future addToCart(CartModel cartModel) async {
    try {
      await CartDatabaseHelper.instance.insert(cartModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getCartItems() async {
    try {
      isLoading.value = true;
      final datas = await CartDatabaseHelper.instance.query();
      cartItems.value = datas;
      if (datas.isNotEmpty) {
        getItemSubtotal();
      }
      isLoading.value = false;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future getItemSubtotal() async {
    try {
      final subtotal = await CartDatabaseHelper.instance.getItemSubtotal();
      this.subtotal.value = subtotal;
    } catch (e) {
      throw Exception(e);
    }
  }

  void setDefaultSubTotal() {
    this.subtotal.value = 0;
  }

  Future updateCartItem(CartModel cartModel) async {
    try {
      await CartDatabaseHelper.instance.update(cartModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future increaseQuantity(CartModel item) async {
    CartModel cartModel = CartModel(
      id: item.id,
      name: item.name,
      price: item.price,
      quantity: item.quantity! + 1,
      image: item.image,
      subtotalPerItem: item.subtotalPerItem! + item.price!,
    );
    try {
      await CartDatabaseHelper.instance
          .update(cartModel)
          .then((value) => getCartItems().then((value) => getItemSubtotal()));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future decreaseQuantity(CartModel item) async {
    CartModel cartModel = CartModel(
      id: item.id,
      name: item.name,
      price: item.price,
      quantity: item.quantity! - 1,
      image: item.image,
      subtotalPerItem: item.subtotalPerItem! - item.price!,
    );
    try {
      await CartDatabaseHelper.instance.update(cartModel).then((value) {
        if (cartItems.isNotEmpty) {
          getCartItems().then((value) => getItemSubtotal());
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteCartItem(int id) async {
    try {
      await CartDatabaseHelper.instance.delete(id).then((value) {
        if (cartItems.isNotEmpty) {
          getCartItems().then((value) => getItemSubtotal());
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future deleteAllData() async {
    try {
      await CartDatabaseHelper.instance.deleteAllData();
    } catch (e) {
      throw Exception(e);
    }
  }
}
