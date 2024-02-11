import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mitra Profile'),
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        automaticallyImplyLeading: true,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Color.fromARGB(255, 158, 0, 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.93,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset("assets/logo.jpeg"),
            ),
            SizedBox(height: 15),
            Text(
              'BFC Exprezz (Ghaney)',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 5)),
            ),
            SizedBox(height: 30),
            Text(
              'B Fried Chicken Exprezz berdiri sejak tahun 2016, salah satu cabangnya (Ghaney) berlokasi di Jalan Sunyaragi No. 53, Sunyaragi, Kec.Kesambi, Kota Cirebon, Jawa Barat, 45132 (parkiran Indomaret).',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 255, 255, 5)),
            ),
            SizedBox(height: 10),
            Text(
              'BFC Exprezz mampu bersaing dengan restoran lainnya di wilayah Cirebon, karena harganya terjangkau dan mempunyai pelayanan yang ramah kepada pelanggan.',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 255, 255, 5)),
            ),
          ],
        ),
      ),
    );
  }
}
