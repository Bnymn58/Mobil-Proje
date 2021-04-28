import 'package:flutter/material.dart';
import 'package:flutter_app/ders_bilgi.dart';
import 'package:flutter_app/hakkimda.dart';
import 'package:flutter_app/ana_sayfa.dart';

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
