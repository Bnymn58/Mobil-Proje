import 'package:flutter/material.dart';
import 'package:flutter_app/hakkimda.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/ana_sayfa.dart';
import 'package:flutter_app/ders_bilgi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: {
        "/":(context)=>LoginPage(),
        "/homepage":(context)=>Ana_Giris(),
        "/hakkinde":(context)=>Hakkinda(),
        "/dersbil":(context)=>Ders_bilgi(),
      },
    );
  }
}
