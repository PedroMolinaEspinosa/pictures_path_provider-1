import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pictures_path_provider/pictures_path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _picturesPath = "Unknown";

  _getPicturesPath() async{
    String path = await PicturesPathProvider.getPicturesDirPath;
    if(mounted){
      setState(() {
        _picturesPath = path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PicturesPathProvider'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _picturesPath,
                style: Theme.of(context).textTheme.title,
              ),
              RaisedButton(
                onPressed: () => _getPicturesPath(),
                child: Text("Get Pictures Path"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
