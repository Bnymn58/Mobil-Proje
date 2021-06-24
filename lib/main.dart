
import 'package:flutter/material.dart';
import 'package:flutter_app/hakkimda.dart';
import 'package:flutter_app/ana_sayfa.dart';
import 'package:flutter_app/ders_bilgi.dart';
import 'package:flutter_app/file_operations.dart';
import 'package:flutter/gestures.dart';
import 'dart:math' as math;
import 'file_utils.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter_app/file_download.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/models/Data_class.dart';
import 'package:flutter_app/loginpage/login_pages1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      routes: {
       "/":(context)=>Ana_Giris(),
        //"/":(context)=>Login_pages1(),
        //"/":(context)=>FileOperationsScreen(),
        "/gunluk":(context)=>FileOperationsScreen(),
        "/indir":(context)=>FileDownloadView(),
        "/homepage":(context)=>Ana_Giris(),
        "/hakkinde":(context)=>Hakkinda(),
        "/dersbil":(context)=>Ders_bilgi(),

      },
    );
  }
}
