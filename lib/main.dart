import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/hakkimda.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/ana_sayfa.dart';

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
      },
    );
  }
}
