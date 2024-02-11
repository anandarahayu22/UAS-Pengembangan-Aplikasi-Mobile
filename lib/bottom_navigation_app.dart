import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pos_bfc/main.dart';
import 'package:pos_bfc/views/cart.dart';
import 'package:pos_bfc/views/dashboard.dart';
import 'package:pos_bfc/views/menu.dart';
import 'package:pos_bfc/views/riwayat.dart';

class BottomNavigationApp extends StatefulWidget {
  const BottomNavigationApp({super.key});

  @override
  State<BottomNavigationApp> createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp> {
  List<Widget> bodyView = [
    DashboardView(),
    MenuView(),
    RiwayatView(),
  ];

  int _index = 0;

  void _onTapItem(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 158, 0, 0),
      body: bodyView[_index],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.yellow,
            primaryColor: Color.fromARGB(255, 158, 0, 0),
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(titleMedium: const TextStyle(color: Colors.yellow))),
        child: BottomNavigationBar(
            backgroundColor: Colors.yellow,
            fixedColor: Color.fromARGB(255, 158, 0, 0),
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            onTap: _onTapItem,
            currentIndex: _index,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_dining_rounded),
                label: "Menu",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.paste),
                label: "Riwayat",
              ),
            ]),
      ),
    );
  }
}
