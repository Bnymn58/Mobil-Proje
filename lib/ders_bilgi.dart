import 'package:flutter/material.dart';

import 'package:flutter_app/ana_sayfa.dart';

class Ders_bilgi extends StatefulWidget {
  @override
  _Ders_bilgiState createState() => _Ders_bilgiState();
}

class _Ders_bilgiState extends State<Ders_bilgi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ders Bilgisi"),
      ),
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:60.0),
                child: Text(
                  "Ders İçeriğine ulaşılamadı!!!",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(70.0),
                  child: ElevatedButton(
                    //ANASAYFAYA DÖNDÜRÜR
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ana_Giris(),),
                      );
                    },
                    child: Text('Anasayfaya Dön'),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
