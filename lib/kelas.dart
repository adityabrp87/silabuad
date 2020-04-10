import 'package:flutter/material.dart';
import 'package:silabuad/variabelColor.dart';

class Kelas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: Column(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Icon(Icons.class_,size: 90.0,color: SilabColor.secondary,),
            new Text("Kelas", style: new TextStyle(fontSize: 30.0, color: SilabColor.tertiary),)
          ],
        ),
      ),
    );
  }
}