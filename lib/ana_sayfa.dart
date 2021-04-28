import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/class_lib.dart';

class Ana_Giris extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  TabController tabController;

  List<Widget> sayfalar = [
    Tab(
      text: "Galatasaray",
      icon: Icon(Icons.contacts_outlined),
    ),
    Tab(
      text: "3DS MAX",
      icon: Icon(
        Icons.design_services,
      ),
    ),
    Tab(
      text: "Dersler",
      icon: Icon(Icons.book_online),
    ),
    Tab(
      text: "Kitaplar",
      icon: Icon(Icons.book_online),
    ),
    Tab(
      text: "Hobiler",
      icon: Icon(Icons.sports_bar),
    ),
    hakkindaYaz(),
  ];
  List<Widget> bodydesing = [
    Center(
      child: Image(image: AssetImage("images/image1.jpg")),
    ),
    Center(
      child: Image(image: AssetImage("images/image4.jpg")),
    ),
    ders_listele(),
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/image3.jpg"),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Stack(
          //ŞEKİLLİ YAZI
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Yaşadığımız dönemin en büyük cahili, diploma almayı eğitim sananlardır..!',
                style: TextStyle(
                  fontSize: 30,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.blue[700],
                ),
              ),
            ),
            // Solid text as fill.
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Yaşadığımız dönemin en büyük cahili, diploma almayı eğitim sananlardır..!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.redAccent[300],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Center(
      child: Image(image: AssetImage("images/image1.jpg")),
    ),
    Center(
      child: Text(
        "BUTTON \t THE \t CLICK :)",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: sayfalar.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KİŞİSEL ASİSTANIM"),
        centerTitle: true,
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.white, //tıklanınca altını çizen kod
          isScrollable: true, //kayar menü
          unselectedLabelStyle: TextStyle(fontSize: 15),
          controller: tabController,
          tabs: sayfalar,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: bodydesing,
      ),
    );
  }
}
