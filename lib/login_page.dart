import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:pos_bfc/bottom_navigation_app.dart';
import 'dart:convert';
import 'dart:developer';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _visible = false;
  final userController = TextEditingController();
  final pwdController = TextEditingController();
  Future userLogin() async {
    String url = "https://bfc.isibi.web.id/";
    setState(() {
      _visible = true;
    });

    var data = {
      'username': userController.text,
      'password': pwdController.text,
    };
    log("DATA === $data");
    log("URL === $url");
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    log("Status Code === ${response.statusCode}");
    if (response.statusCode == 200) {
      log("RESPONSE === ${response.body}");
      print(response.body);
      setState(() {
        _visible = false;
      });
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BottomNavigationApp()));
    } else {
      setState(() {
        _visible = false;
        showMessage("Error during connecting to Server.");
      });
    }
  }

  Future<dynamic> showMessage(String _msg) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(_msg),
          actions: <Widget>[
            TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 0, 0),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: _visible,
              child: Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: LinearProgressIndicator(),
              ),
            ),
            Container(
              height: 200,
            ),
            Center(
              child: Container(
                width: 370,
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/logo.jpeg"),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              'Login BFC Exprezz',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Theme(
                      data: new ThemeData(
                        primaryColor: Colors.yellow,
                        primaryColorDark: Colors.yellow,
                        hintColor: Colors.yellow,
                      ),
                      child: TextFormField(
                        controller: userController,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                          ),
                          errorBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedErrorBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          labelText: 'Username',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.yellow,
                          ),
                          border: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                          ),
                          hintText: 'Enter username',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Theme(
                      data: new ThemeData(
                        primaryColor: Colors.yellow,
                        primaryColorDark: Colors.yellow,
                        hintColor: Colors.yellow,
                      ),
                      child: TextFormField(
                        controller: pwdController,
                        obscureText: true,
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          focusedBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                          ),
                          enabledBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                          ),
                          errorBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                            ),
                          ),
                          focusedErrorBorder: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                          ),
                          border: new OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              style: BorderStyle.solid,
                            ),
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.white),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.yellow,
                          ),
                          hintText: 'Enter password',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => {
                          if (_formKey.currentState!.validate()) {userLogin()}
                        },
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text(
                            'Login',
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.yellow),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
