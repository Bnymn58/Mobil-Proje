import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/loginpage/login_pages2.dart';
import 'dart:math';
import 'package:flutter_app/ana_sayfa.dart';


var kBackgroundColor = Colors.black38;
Color kPrimaryColor = Colors.blueGrey;
Color kPrimaryColor2 = Colors.black;
Color kPrimaryColorani = Colors.black;

String username;
String password;

class login_pages2 extends StatefulWidget {
  @override
  _login_pages2State createState() => _login_pages2State();


}

@override
class UniqueColorGenerator {
  static Random random = new Random();
  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

class _login_pages2State extends State<login_pages2> {

  final _formkey = GlobalKey<FormState>();

  @override
  void giris_kontrol(){
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      if (username == "bg" && password == "58") {
        debugPrint("Giriş Başarılı");
        Navigator.pushNamed(context, "/homepage");

        //KONTROLLERİ YAPAR VE ANA SAYFAYA AKTARIR
      } else {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Hata!!!"),
                content: Text(
                    "Giriş Bilgileriniz Hatalı :( Lütfen Tekrar Deneyiniz..."),
                actions: <Widget>[
                  MaterialButton(
                      child: Text("Geri Dön"),
                      onPressed: () => Navigator.pop(context)),
                ],
              );
            });
      }
    }

  }

  Widget _loginButton() =>FittedBox(
    child: GestureDetector(
      onTap: () {
        giris_kontrol();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        padding:
        EdgeInsets.symmetric(horizontal: 26, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          //color: kPrimaryColor,
          color: Colors.green,
        ),
        child: Row(
          children: <Widget>[
            Text(
              "GİRİŞ YAP ",
              style: Theme.of(context).textTheme.button.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 12),
            Icon(
              Icons.not_started,
              color: Colors.white,
            )
          ],
        ),
      ),
    ),
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                color: kPrimaryColorani,
                child: Padding(
                  padding: const EdgeInsets.all(4.2),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/login_page1.jpg"),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Kullanıcı Girişi",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          "Giriş",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ],
                    ),

                    Spacer(), //boşluk bırakıyor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.login_rounded,
                              color: kPrimaryColor,
                            ),
                          ),
                          Expanded(
                            child:TextFormField(
                              decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  //Texte Ovallik ve Border verir
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(),
                                ),

                                hintText:
                                "Lütfen Kullanıcı Adını Giriniz.", //TEXT içinde yazan
                                labelText: "Kullanıcı Adı(bg)",
                                labelStyle: TextStyle(
                                    color: Colors.grey, fontWeight: FontWeight.bold),

                                focusedBorder: new OutlineInputBorder(
                                  //Texte düz ve mavi Border verir
                                  borderSide: new BorderSide(
                                    color: Colors.blue,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Kullanıcı Adını Giriniz";
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                 username = value;
                              },
                              onChanged: (text){
                                setState(() {
                                  kPrimaryColorani=UniqueColorGenerator.getColor();
                                });
                              },
                            ),
                            //SizedBox(height: 20.0),
                          )
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: new OutlineInputBorder(
                                //Texte Ovallik ve Border verir
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(),
                              ),
                              hintText: "Lütfen Şifre Giriniz.",
                              labelText: "Şifre(58)",
                              labelStyle: TextStyle(
                                  color: Colors.grey, fontWeight: FontWeight.bold),
                              focusedBorder: new OutlineInputBorder(
                                //Texte düz ve mavi Border verir
                                borderSide: new BorderSide(
                                  color: Colors.blue,
                                  width: 3.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Şifre Giriniz Giriniz";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              password = value;
                            },
                            onChanged: (text){
                              setState(() {
                                kPrimaryColorani=UniqueColorGenerator.getColor();
                              });
                            },


                          ),

                        ),
                      ],
                    ),
                    Spacer(),
                    _loginButton(),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
