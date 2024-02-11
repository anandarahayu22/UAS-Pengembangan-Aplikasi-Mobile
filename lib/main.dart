import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pos_bfc/bottom_navigation_app.dart';
import 'package:pos_bfc/login_page.dart';
import 'dart:convert';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color.fromARGB(255, 158, 0, 0),
        hintColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(
        title: 'Login',
      ), // Ganti MyHomePage dengan LoginPage
    );
  }
}
