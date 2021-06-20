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


class Ana_Giris extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnaSayfa(),
    );
  }
}


class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> with TickerProviderStateMixin {
  TabController tabController;
  String fileContents = "Veri Yok";
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: sayfalar.length, vsync: this);
  }

  @override
  Widget build(BuildContext context)=>DefaultTabController(
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
        )

      ),
  );

  //RESİMLER LİSTESİ

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

      //child: Image(image: AssetImage("assets/images/image1.jpg")),
    ),
    Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.end,
        children: <Widget>[
          //ElevatedButton(onPressed: (){}, child:Text("Günlük Ekleme")),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              child:Icon(Icons.add),
                backgroundColor: Colors.orangeAccent,
                onPressed:(){


                },
            ),
          ),


        ],
      ),


      //child: Image(image: AssetImage("assets/images/image1.jpg")),
    ),

    resimler(),

    ders_listele(),
    Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/image3.jpg"),
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
      child: Image(image: AssetImage("assets/images/image1.jpg")),
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




}
