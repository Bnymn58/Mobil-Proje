import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/hakkimda.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/ana_sayfa.dart';
import 'package:flutter_app/main.dart';


class Ana_Giris extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
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

    void _submit() {
      setState(() {

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

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Hakkinda()),
                );
              },
              child: Text('Hakkında'),
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
          ],

        ),
      ),
    );
  }
}
