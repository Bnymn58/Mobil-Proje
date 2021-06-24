
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/ders_bilgi.dart';
import 'package:flutter_app/hakkimda.dart';
import 'package:flutter_app/ana_sayfa.dart';
import 'package:flutter/gestures.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

class image_zoom extends StatefulWidget {
  int index=0;
  image_zoom({this.index});
  @override
  _image_zoomState createState() => _image_zoomState();
}

class _image_zoomState extends State<image_zoom> {

  @override
  Widget build(BuildContext context) {

    var index2=widget.index;
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(

        title: Text("Kişisel Asistanım (Image Zoom)"),
        titleSpacing: 0,
        leading:IconButton(
          icon:Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),

        flexibleSpace: Container(
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage("assets/images/wallpaper.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),

      ),
      body: Center(
        child:Container(
          decoration:new BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onDoubleTap: (){

              },
              child: InteractiveViewer(
                  minScale: 0.2,
                  maxScale: 100.2,
                  child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($index2).jpg"))
              ),
            ),
          ),
        ),
      ),
    );
  }
}
