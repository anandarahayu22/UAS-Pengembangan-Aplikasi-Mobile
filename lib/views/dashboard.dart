import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:pos_bfc/main.dart';
import 'package:pos_bfc/login_page.dart';
import 'package:pos_bfc/views/profile.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 0, 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 2,
            color: Colors.yellow,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 16,
                right: 16,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Halo, Selamat Datang!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: const AssetImage('assets/warung.jpg'),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.transparent,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileView()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "BFC EXPREZZ",
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "(Ghaney)",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage(title: 'Login')),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            child: Text(
              "BEST MENU",
              style: TextStyle(
                fontSize: 24,
                height: 1.8,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ItemGridView()
          // DashboardView()
        ],
      ),
    );
  }
}

class ItemGridView extends StatelessWidget {
  Items item1 = new Items(
      title: "Alacarte 1",
      subtitle: "Paha Bawah/Sayap",
      event: "Rp. 9000",
      img: "assets/alacarte1.jpeg");

  Items item2 = new Items(
    title: "Alacarte 2",
    subtitle: "Paha Atas/Dada",
    event: "Rp. 13.000",
    img: "assets/alacarte2.jpeg",
  );
  Items item3 = new Items(
    title: "Exprezz 1",
    subtitle: "Paha Bawah/Sayap + Nasi",
    event: "Rp. 13.000",
    img: "assets/exprezz1.jpeg",
  );
  Items item4 = new Items(
    title: "Exprezz 2",
    subtitle: "Paha Atas/Dada + Nasi",
    event: "Rp. 17.000",
    img: "assets/exprezz2.jpeg",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Color.fromARGB(255, 158, 0, 0),
                        image: DecorationImage(
                          image: AssetImage(data.img),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          data.title,
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          data.subtitle,
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600)),
                        ),
                        Text(
                          data.event,
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                                  color: Colors.black45,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;

  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}
