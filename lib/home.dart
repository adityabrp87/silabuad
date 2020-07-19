import 'package:flutter/material.dart';
import 'package:silabuad/variabelColor.dart';
import './jadwal.dart' as jadwal;
import './kelas.dart' as kelas;
import './info.dart' as info;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './sign_in.dart' as sign;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
    return MaterialApp(
      home: Scaffold(
      appBar: new AppBar(
        //warna background
        backgroundColor: SilabColor.primary,
        //judul
        title: Row (
          children: <Widget>[
            Text ('SILAB'),
            Expanded(child: Container(),  ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                sign.imageUrl,

              ),
              radius: 23,
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
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
          new kelas.KelasPage(),
          new info.Info(),
          new jadwal.Jadwal()
        ],
      ),
    )
    );
  }
}
