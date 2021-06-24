import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_app/models/Data_class.dart';
import 'dart:async';
import 'package:flutter_app/class_lib.dart';



class Firebase_data extends StatefulWidget {
  @override
  _Firebase_dataState createState() => _Firebase_dataState();
}

class _Firebase_dataState extends State<Firebase_data> {
  Color kPrimaryColor2=Colors.white;
  String soz_yaz="";
  void initState() {
    // TODO: implement initState
    super.initState();
    Color kPrimaryColor2=Colors.white;
    soz_yaz="";
  }
  final _textController=TextEditingController();
  final _yazarController=TextEditingController();

  get width => null;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
          children: [
            Form(
              child: Column(
                children:<Widget> [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Beğendiğimiz Sözü ve Yazarını Ekleyebiliriz"),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: new InputDecoration(labelText: 'Başlık'),
                      controller: _textController,
                      validator: (val) =>
                      val.isNotEmpty ? null : 'Boş Bırakılmaz!!!',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: new InputDecoration(labelText: 'Yazar'),
                      controller: _yazarController,
                      validator: (val) =>
                      val.isNotEmpty ? null : 'Boş Bırakılmaz!!!',
                    ),
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.orangeAccent,
                    child: Container(
                        width: width * 0.9,
                        child: Text(
                          'Eklemek İçin Tıkla',
                          textAlign: TextAlign.center,
                        )),
                    onPressed: () {
                      setState(() {
                        kPrimaryColor2=Colors.black;
                        soz_yaz="söz: Bünyamin Gençtürk";
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Sorun Özür Dileriz!!!"),
                                content: Text(
                                    "Bazı Teknik Sorunlardan Ötürü İşlem Gerçekleştirilmedi \n 🙁 \n Lütfen Tekrar Deneyiniz..."),
                                actions: <Widget>[
                                  MaterialButton(
                                      child: Text("Geri Dön"),
                                      onPressed: () => Navigator.pop(context)),
                                ],
                              );
                            });

                      });

                    },
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text("Günün Sözü ($soz_yaz)"),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\n ™ Yaşadığımız dönemin en büyük cahili, diploma almayı eğitim sananlardır..! ™ \n ",
                                style: TextStyle(color:kPrimaryColor2,fontSize: 30.0,fontFamily: "Roboto",fontWeight: FontWeight.w300,),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),




                ],
              ),
            ),
          ],
        ),

    );
  }
}
