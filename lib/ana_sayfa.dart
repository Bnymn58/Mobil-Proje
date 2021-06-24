import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/class_lib.dart';
import 'package:flutter/gestures.dart';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart';
import 'file_utils.dart';
import 'package:flutter_app/file_operations.dart';
import 'package:http/http.dart';
import 'package:open_file/open_file.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/models/Data_class.dart';
import 'package:flutter_app/sql/sql_pagedesign.dart';
import 'package:flutter_app/graphics_and_animation.dart';
import 'package:flutter_app/sql/firebase_datebase.dart';


class Ana_Giris extends StatefulWidget {
  @override
  _Ana_GirisState createState() => _Ana_GirisState();
}

class _Ana_GirisState extends State<Ana_Giris>with TickerProviderStateMixin {

  TabController tabController;
  String fileContents = "Veri Yok";
  final myController = TextEditingController();


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: sayfalar.length,vsync: this);
  }
  @override
  List<Widget> sayfalar = [
    Tab(
      text: "Galatasaray",
      icon: Icon(Icons.contacts_outlined),
    ),
    Tab(
      text: "Günlük",
      icon: Icon(Icons.app_registration),
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
      text: "Özel Sözler",
      icon: Icon(Icons.book_online),
    ),
    Tab(
      text: "Grafik",
      icon: Icon(Icons.add_chart),
    ),
    hakkindaYaz(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(

        title: Text("Kişisel Asistanım"),
        titleSpacing: 0,
        leading:IconButton(
          icon:Icon(Icons.menu),
          onPressed: (){

          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: (){

              }
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){

              }
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage("assets/images/wallpaper.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.blue, //tıklanınca altını çizen kod
          isScrollable: true, //kayar menü
          unselectedLabelStyle: TextStyle(fontSize: 15),
          controller: tabController,
          tabs: sayfalar,
        ),
      ),

        body:Container(
          child:TabBarView(
            controller: tabController,
            children: bodydesing,
          ) ,
        ),

    ),
    );
  }

  @override
  List<Widget> bodydesing = [
    Center(
      child: Image(image: AssetImage("assets/images/image1.jpg")),
    ),

    bilgi_cek(),
    resimler(),

    ders_listele(),
    Firebase_data(),
    LineChartSample1(),
    hakkinda_renkli(),
  ];


}

//debugShowCheckedModeBanner: false,
