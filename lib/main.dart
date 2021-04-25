import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyHomePage(),
  )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'İlk Flutter Yazılım'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    String ex1 = "GALATASARAY ";
    void _submit() {
      setState(() {
           ex1 = "Basarili";
      });
    }
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text("Flutter Yazılımım"),
      ),

      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage("images/image1.jpg"),
              fit:BoxFit.cover,
            )
        ),
        child:Column(
        children: [
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: Colors.yellow,
                width: 5
              )
            ),
          child:Center(
            child: Padding(padding: const EdgeInsets.all(20.0),
              child: Text(ex1,
                style: TextStyle(
                  color: Colors.red,
                ),

              ),
            ),
          ),
          )
          ,

          MaterialButton(
            splashColor: Colors.green,
            color: Colors.blue,
            onPressed: _submit,
            child: Text(
              "Material Button",
              style: TextStyle(fontSize: 20.0,
                color: Colors.white,
              ),

            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),

          MaterialButton(
            splashColor: Colors.green,
            color: Colors.blue,
            onPressed: _submit,
            child: Text(
              "Material Button",
              style: TextStyle(fontSize: 20.0,
                color: Colors.white,
              ),

            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),



          Padding(
            padding: const EdgeInsets.all(58.0),
            child: Center(
              child: MaterialButton(
                splashColor: Colors.yellow,
                color: Colors.red,
                onPressed: () {},
                child: Text(
                  "Material Button2",
                  style: TextStyle(fontSize: 20.0,
                    color: Colors.white,
                  ),

                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          Container(height: 30,color: Colors.blue,
              child: Marquee(
                text:'Programmer is Bünyamin Gençtürk. @Gençtürk Software Tüm Hakları Saklıdır.',
                style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white,),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 50.0,
                pauseAfterRound: Duration(seconds: 1),
                showFadingOnlyWhenScrolling: true,
                fadingEdgeStartFraction: 0.1,
                fadingEdgeEndFraction: 0.1,
                startPadding: 15.0,
                numberOfRounds:50,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              )
          ),
        ],


        /*
          child: Column(
        children: <Widget>[
          Text("Hadi Bismillah:))"),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Öğrenci Numaranız:",
            ),
          ),
          */





      ),
      ),
    );
  }
}
