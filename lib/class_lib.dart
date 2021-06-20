import 'package:flutter/material.dart';
import 'package:flutter_app/ders_bilgi.dart';
import 'package:flutter_app/hakkimda.dart';
import 'package:flutter_app/ana_sayfa.dart';
import 'package:flutter/gestures.dart';
import 'dart:math' as math;

//**********] HAKKINDA SAYFASINA YÖNLENDİREN SINIF [**********//

class hakkindaYaz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            RaisedButton(
              //hakkında sayfasına yönlendirir
              child: Text("Hakkında"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Hakkinda()),
                );
              },
              color: Colors.blue,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
            ),
          ],
        ),
      ),
    );
  }
}

//**********] function [**********//

void hakkinda_click(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Hakkinda()),
  );
}

void Resim_degis(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder:
        (BuildContext context) => AnaSayfa(),
    ),
  );
}

//**********] DERS LİSTESİ SINIF [**********//
//
class ders_listele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Mobil Programlama'),
              subtitle: Text("Ders Kodu:#1"),
              trailing: Icon(Icons.arrow_back_rounded),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ders_bilgi()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('PROGRAMLAMA DİLİ-2'),
              subtitle: Text("Ders Kodu:#2"),
              trailing: Icon(Icons.arrow_back_rounded),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ders_bilgi()),
                );
              }
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Yazılım Mühensiliği'),
              subtitle: Text("Ders Kodu:#3"),
              trailing: Icon(Icons.arrow_back_rounded),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ders_bilgi()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Matematik-2'),
              subtitle: Text("Ders Kodu:#4"),
              trailing: Icon(Icons.arrow_back_rounded),
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ders_bilgi()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class resimler extends StatefulWidget {
  @override
  _resimlerState createState() => _resimlerState();
}

int sayi1,sayi2,sayi3,sayi4,sayi5;
int random_yaz(){
  sayi1=math.Random().nextInt(20);
  sayi2=math.Random().nextInt(20);
  sayi3=math.Random().nextInt(20);
  sayi4=math.Random().nextInt(20);
  sayi5=math.Random().nextInt(20);
}


class _resimlerState extends State<resimler> {
  @override
  // TODO: implement widget
  resimler get widget => super.widget;
  @override
  Widget build(BuildContext context) {
    setState(() {
      random_yaz();
    });
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.start,
            children:<Widget>[
              FlatButton(
                textColor: Colors.white,
                height: 60.0,
                color: Colors.green,
                onPressed: () {
                  Resim_degis(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.refresh, color: Colors.white,),
                    ),
                    Text('GÜNCEL 3DS MAX ÇALIŞMALARIM', )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi1).jpg")),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi2).jpg")),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi3).jpg")),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi4).jpg")),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi5).jpg")),
              ),


            ],
          ),


        ),
      ),
    );
  }
}






