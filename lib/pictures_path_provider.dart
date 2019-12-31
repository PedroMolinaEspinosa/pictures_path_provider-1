import 'dart:async';

import 'package:flutter/services.dart';

class PicturesPathProvider {
  static const MethodChannel _channel =
      const MethodChannel('pictures_path_provider');

  static Future<String> get getPicturesDirPath async{
    String path;
    try{
       path = await _channel.invokeMethod('getPicturesPath');
    }catch(e){
      print(e);
      path = "Unknown";
    }
    return path;
  }
}
