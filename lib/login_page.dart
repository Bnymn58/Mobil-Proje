import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formkey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("images/image2.jpg"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    //ŞEKİLLİ YAZI
                    child: Stack(
                      children: <Widget>[
                        Text(
                          '     Bizimkisi Bir (:Widget Hikayesi :)',
                          style: TextStyle(
                            fontSize: 40,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 6
                              ..color = Colors.red[700],
                          ),
                        ),
                        // Solid text as fill.
                        Text(
                          '     Bizimkisi Bir (:Widget Hikayesi :)',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.yellow[300],
                          ),
                        ),
                      ],
                    )),

                //***KULLANICI ADI***///
                TextFormField(
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
                        color: Colors.red, fontWeight: FontWeight.bold),

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
                ),
                SizedBox(height: 20.0),

                //***ŞİFRE***///
                TextFormField(
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      //Texte Ovallik ve Border verir
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    hintText: "Lütfen Şifre Giriniz.",
                    labelText: "Şifre(58)",
                    labelStyle: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
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
                ),
                SizedBox(height: 50.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _uyeolButton(),
                    MaterialButton(
                        child: Text("Şifremi Unuttum"), onPressed: () {}),
                  ],
                ),
                _loginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //KONTROLSÜZ GİRİŞ
  Widget _loginButton2() => RaisedButton(
      child: Text("Giriş Yap"),
      onPressed: () {
        Navigator.pushNamed(context, "/homepage");
      });

  Widget _loginButton() => RaisedButton(
      child: Text("Giriş Yap"),
      onPressed: () {
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
      });

  Widget _uyeolButton() => MaterialButton(
      child: Text("Üye Ol"),
      onPressed: () {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("!!!Warning!!!"),
                content: Text("En Kısa Zamanda İnşallah.."),
                backgroundColor: Colors.yellow,
                actions: <Widget>[
                  MaterialButton(
                      child: Text("Geri Dön"),
                      onPressed: () => Navigator.pop(context)),
                ],
              );
            });
      });
}
