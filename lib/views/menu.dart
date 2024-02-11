import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:pos_bfc/controllers/cart_controller.dart';
import 'package:pos_bfc/models/cart_model.dart';
import 'package:pos_bfc/views/cart.dart';

class MenuView extends StatelessWidget {
  final List<Map<String, dynamic>> foodList = [
    {
      'id': 1,
      'name': 'Exprezz 1 Original',
      'price': 13000,
      'image': 'exprezz1.jpeg'
    },
    {
      'id': 2,
      'name': 'Exprezz 1 Spicy',
      'price': 13000,
      'image': 'exprezz1.jpeg'
    },
    {
      'id': 3,
      'name': 'Exprezz 2 Original',
      'price': 17000,
      'image': 'exprezz2.jpeg'
    },
    {
      'id': 4,
      'name': 'Exprezz 2 Spicy',
      'price': 17000,
      'image': 'exprezz2.jpeg'
    },
    {'id': 5, 'name': 'Dada Original', 'price': 13000, 'image': 'dada.png'},
    {'id': 6, 'name': 'Dada Spicy', 'price': 13000, 'image': 'dadas.png'},
    {
      'id': 7,
      'name': 'Paha Atas Original',
      'price': 13000,
      'image': 'pahatas.png'
    },
    {'id': 8, 'name': 'Paha Atas Spicy', 'price': 13000, 'image': 'atas.png'},
    {
      'id': 9,
      'name': 'Paha Bawah Original',
      'price': 9000,
      'image': 'pahabawah.png'
    },
    {'id': 9, 'name': 'Paha Bawah Spicy', 'price': 9000, 'image': 'bawahs.png'},
    {'id': 10, 'name': 'Sayap Original', 'price': 9000, 'image': 'sayap.png'},
    {'id': 11, 'name': 'Sayap Spicy', 'price': 9000, 'image': 'sayaps.png'},
    {'id': 12, 'name': 'Tambahan Nasi', 'price': 4000, 'image': 'nasi.png'},
    // ... (other menu items)
  ];

  @override
  Widget build(BuildContext context) {
    final cartC = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Menu Apa Hari ini?'),
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(CartView());
              print("abc");
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 158, 0, 0),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          leading: Image.asset(
                            'assets/${foodList[index]['image']}',
                            width: 90,
                            height: 80,
                          ),
                          title: Text(foodList[index]['name']),
                          subtitle: Text("${foodList[index]['price']}"),
                          trailing: IconButton(
                              icon: Icon(Icons.add_shopping_cart_rounded),
                              onPressed: () {
                                cartC
                                    .addToCart(CartModel(
                                        id: foodList[index]['id'],
                                        name: foodList[index]['name'],
                                        price: foodList[index]['price'],
                                        quantity: 1,
                                        image:
                                            'assets/${foodList[index]['image']}',
                                        subtotalPerItem: foodList[index]
                                            ['price']))
                                    .then((value) {
                                  log("valueCart = $value");
                                  Get.to(CartView());
                                });
                              }),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
