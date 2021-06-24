
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/ders_bilgi.dart';
import 'package:flutter_app/hakkimda.dart';
import 'package:flutter_app/ana_sayfa.dart';
import 'package:flutter/gestures.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'package:flutter_app/image_zoom.dart';
import 'package:flutter_app/loginpage/login_pages1.dart';

//**********] HAKKINDA SAYFASINA YÖNLENDİREN SINIF [**********//
int index=0;

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
        (BuildContext context) => Ana_Giris(),
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

int sayi1,sayi2,sayi3,sayi4,sayi5;
int random_yaz(){
  sayi1=1+math.Random().nextInt(19);
  sayi2=1+math.Random().nextInt(19);
  sayi3=1+math.Random().nextInt(19);
  sayi4=1+math.Random().nextInt(19);
  sayi5=1+math.Random().nextInt(19);
}

class resimler extends StatefulWidget {
  @override
  _resimlerState createState() => _resimlerState();
}

class _resimlerState extends State<resimler>with SingleTickerProviderStateMixin {

  Animation _animation;
  AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=new AnimationController(vsync: this,duration: Duration(microseconds: 500));
    _animation=Tween(begin: 1.0,end:3.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))..addListener(() {
      setState(() {

      });
    });
  }

  resimler get widget => super.widget;
  @override
  Widget build(BuildContext context) {
    setState(() {
      if(index==0){
        random_yaz();
        index++;
      }

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
                  setState((){
                    random_yaz();
                  });

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
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap:(){
                    if(_animationController.isCompleted){
                      _animationController.reverse();
                    }
                    else{
                      _animationController.forward();
                    }
                  },
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>image_zoom(index: sayi1,),),);
                  },
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.diagonal3(Vector3(_animation.value,_animation.value,_animation.value)),
                      child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi1).jpg")),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>image_zoom(index: sayi2,),),);
                  },
                  child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi2).jpg")),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>image_zoom(index: sayi3,),),);
                  },
                  child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi3).jpg")),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>image_zoom(index: sayi4,),),);
                  },
                  child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi4).jpg")),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onDoubleTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>image_zoom(index: sayi5,),),);
                  },
                  child: Image(image: AssetImage("assets/images/3dsmax/3ds1 ($sayi5).jpg")),
                ),
              ),


            ],
          ),


        ),
      ),
    );
  }
}

class hakkinda_renkli extends StatefulWidget {
  @override
  _hakkinda_renkliState createState() => _hakkinda_renkliState();
}

class _hakkinda_renkliState extends State<hakkinda_renkli> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: GestureDetector(
          onDoubleTap: (){
            setState(() {
              kPrimaryColor=UniqueColorGenerator.getColor();
            });

          },
          child: Text(
            "BUTTON \t THE \t CLICK :)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: kPrimaryColor,
            ),

          ),
        ),
      ),
    );
  }
}





