import 'package:flutter/material.dart';
import 'package:silabuad/variabelColor.dart';
import './jadwal.dart' as jadwal;
import './kelas.dart' as kelas;
import './info.dart' as info;

void main(){
  runApp(new MaterialApp(
    title: "SILAB",
    home: new Home(),
  ));
}

class  Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  //create controller untuk tabBar
  TabController controller;

  @override

  void initState(){
    controller = new TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //create appBar
      appBar: new AppBar(
        //warna background
        backgroundColor: SilabColor.primary,
        //judul
        title: new Text("SILAB"),
        //bottom
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.class_),text: "Kelas",),
            new Tab(icon: new Icon(Icons.info),text: "Info",),
            new Tab(icon: new Icon(Icons.library_books),text: "Jadwal",),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new kelas.Kelas(),
          new info.Info(),
          new jadwal.Jadwal()
        ],
      ),
    );
  }
}