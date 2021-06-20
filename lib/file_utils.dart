import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';

//Uygulamanın dosyalarının cihaz içerisinde yerleştirildiği dizini döndürecek

class FileUtils {
  static Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }



  //Verilerin yazılacağı dosyanın adını ve yolunu döndürecek.

  static Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/new_text.txt');
  }



  //Aldığı String veriyi dosyaya yazacak

  static Future<File> saveToFile(String gelen_veri) async {
    final file = await getFile;
    return file.writeAsString(gelen_veri);
  }


  //Dosyadaki String veriyi okuyacak

  static Future<String> readFromFile() async {
    try {
      final file = await getFile;
      String fileContents = await file.readAsString(); //dosya içeriğini string olarak dönderir
      return fileContents;
    } catch (e) {
      return "Dosya Okunurken Hata Oluştu!!!"; //hata varsa yazar
    }
  }
}