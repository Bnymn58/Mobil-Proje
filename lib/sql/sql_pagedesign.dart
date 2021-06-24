import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_app/models/Data_class.dart';
import 'dart:async';

class bilgi_cek extends StatefulWidget {
  @override
  _bilgi_cekState createState() => _bilgi_cekState();
}

class _bilgi_cekState extends State<bilgi_cek> {
  final DbManager dbManager=new DbManager();
  final _baslikController=TextEditingController();
  final _notController=TextEditingController();

  final _formKey=new GlobalKey<FormState>();
  Bilgiler bilgiler;
  List<Bilgiler> bilgilist;
  int updateIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children:<Widget> [
                TextFormField(
                  decoration: new InputDecoration(labelText: 'Başlık'),
                  controller: _baslikController,
                  validator: (val) =>
                  val.isNotEmpty ? null : 'Boş Bırakılmaz!!!',
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: 'Not'),
                  controller: _notController,
                  validator: (val) =>
                  val.isNotEmpty ? null : 'Boş Bırakılmaz!!!',
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  child: Container(
                      width: width * 0.9,
                      child: Text(
                        'Ekle',
                        textAlign: TextAlign.center,
                      )),
                  onPressed: () {
                    setState(() {
                      _submitbilgi(context);
                    });

                  },
                ),
                FutureBuilder(
                  future:dbManager.getBilgilerList(),
                  builder:(context,snapshot){
                    if(snapshot.hasData){
                      bilgilist=snapshot.data;
                      return ListView.builder(
                        shrinkWrap:true ,
                        itemCount: bilgilist==null?0:bilgilist.length,
                        itemBuilder: (BuildContext context,int index){
                          Bilgiler bilg=bilgilist[index];
                          return Card(
                            child:Row(
                              children: [
                                Container(
                                  width: width*0.58,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Başlık: ${bilg.baslik}',
                                        style:
                                        TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),

                                      ),
                                      Text('Notunuz: ${bilg.not_yaz}',
                                        style:
                                        TextStyle(fontSize: 15.0),

                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.edit),
                                    color:Colors.green,
                                    onPressed: (){
                                      _baslikController.text=bilg.baslik;
                                      _notController.text=bilg.not_yaz;
                                      bilgiler=bilg;
                                      updateIndex=index;
                                    }
                                ),

                                IconButton(
                                    icon: Icon(Icons.delete),
                                    color:Colors.red,
                                    onPressed: (){
                                      dbManager.deleteBilgi(bilg.not_no);
                                      setState((){
                                        bilgilist.removeAt(index);
                                      });
                                    }
                                ),

                              ],
                            ) ,


                          );
                        },
                      );
                    }
                    return new CircularProgressIndicator();
                  },
                )
              ],
            ),

          ),
        ],
      ),
    );
  }

  void _submitbilgi(BuildContext context){

    if(_formKey.currentState.validate()){
      if(bilgiler==null){
        Bilgiler bilg=new Bilgiler(baslik:_baslikController.text, not_yaz: _notController.text);
        dbManager.insertBilgi(bilg).then((not_no) =>{
          _baslikController.clear(),
          _notController.clear(),
          print('Not Ekleme Başarılı not no ${not_no}'),
        });
      }
      else{
        bilgiler.baslik=_baslikController.text;
        bilgiler.not_yaz=_notController.text;
        dbManager.updateBilgi(bilgiler).then((not_no) =>{
          setState((){
            bilgilist[updateIndex].baslik=_baslikController.text;
            bilgilist[updateIndex].not_yaz=_notController.text;
          }),
          _baslikController.clear(),
          _notController.clear(),
          bilgiler=null
        });
      }
    }
  }


}
