import 'package:flutter/material.dart';
import 'variabelColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart' as sign;
import 'package:slimy_card/slimy_card.dart';

class Jadwal extends StatefulWidget {
  @override
  _JadwalState createState() => _JadwalState();
}

final makebody = Container (
    child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('jadwal').where('uid', isEqualTo: sign.uid).where('hari', isEqualTo: 'senin').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            Center(child: Text('Yeayyy Liburr',style: TextStyle(fontSize: 16.0,color: Colors.white),));
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                DocumentSnapshot document = snapshot.data.documents[index];
                Map<String, dynamic> data = document.data;
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 1.0, color: Colors.black26))),
                      child: Text (data['kelas'],style: TextStyle(fontSize: 16),),
                    ),
                    title: Text(
                      data['nama'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.pin_drop, color: Colors.grey),
                        SafeArea(child: Text(data['tempat'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                        SizedBox(width: 10,),
                        Icon(Icons.timer, color: Colors.grey),
                        SafeArea(child: Text(data['jam'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                      ],
                    ),
                  ),
                );
          }
              );
        }
    )
);

final makebody2 = Container (
    child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('jadwal').where('uid', isEqualTo: sign.uid).where('hari', isEqualTo: 'selasa').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            Center(child: Text('Yeayyy Liburr',style: TextStyle(fontSize: 16.0,color: Colors.white),));
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                DocumentSnapshot document = snapshot.data.documents[index];
                Map<String, dynamic> data = document.data;
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 1.0, color: Colors.black26))),
                      child: Text (data['kelas'],style: TextStyle(fontSize: 16),),
                    ),
                    title: Text(
                      data['nama'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.pin_drop, color: Colors.grey),
                        SafeArea(child: Text(data['tempat'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                        SizedBox(width: 10,),
                        Icon(Icons.timer, color: Colors.grey),
                        SafeArea(child: Text(data['jam'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    )
);

final makebody3 = Container (
    child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('jadwal').where('uid', isEqualTo: sign.uid).where('hari', isEqualTo: 'rabu').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            Center(child: Text('Yeayyy Liburr',style: TextStyle(fontSize: 16.0,color: Colors.white),));
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                DocumentSnapshot document = snapshot.data.documents[index];
                Map<String, dynamic> data = document.data;
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 1.0, color: Colors.black26))),
                      child: Text (data['kelas'],style: TextStyle(fontSize: 16),),
                    ),
                    title: Text(
                      data['nama'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.pin_drop, color: Colors.grey),
                        SafeArea(child: Text(data['tempat'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                        SizedBox(width: 10,),
                        Icon(Icons.timer, color: Colors.grey),
                        SafeArea(child: Text(data['jam'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    )
);

final makebody4 = Container (
    child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('jadwal').where('uid', isEqualTo: sign.uid).where('hari', isEqualTo: 'kamis').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            Center(child: Text('Yeayyy Liburr',style: TextStyle(fontSize: 16.0,color: Colors.white),));
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                DocumentSnapshot document = snapshot.data.documents[index];
                Map<String, dynamic> data = document.data;
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 1.0, color: Colors.black26))),
                      child: Text (data['kelas'],style: TextStyle(fontSize: 16),),
                    ),
                    title: Text(
                      data['nama'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.pin_drop, color: Colors.grey),
                        SafeArea(child: Text(data['tempat'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                        SizedBox(width: 10,),
                        Icon(Icons.timer, color: Colors.grey),
                        SafeArea(child: Text(data['jam'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    )
);

final makebody5 = Container (
    child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('jadwal').where('uid', isEqualTo: sign.uid).where('hari', isEqualTo: 'jumat').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            Center(child: Text('Yeayyy Liburr',style: TextStyle(fontSize: 16.0,color: Colors.white),));
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                DocumentSnapshot document = snapshot.data.documents[index];
                Map<String, dynamic> data = document.data;
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 1.0, color: Colors.black26))),
                      child: Text (data['kelas'],style: TextStyle(fontSize: 16),),
                    ),
                    title: Text(
                      data['nama'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.pin_drop, color: Colors.grey),
                        SafeArea(child: Text(data['tempat'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                        SizedBox(width: 10,),
                        Icon(Icons.timer, color: Colors.grey),
                        SafeArea(child: Text(data['jam'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    )
);

final makebody6 = Container (
    child: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('jadwal').where('uid', isEqualTo: sign.uid).where('hari', isEqualTo: 'sabtu').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          else{
            Center(child: Text('Yeayyy Liburr',style: TextStyle(fontSize: 16.0,color: Colors.white),));
          }
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (BuildContext context, int index){
                DocumentSnapshot document = snapshot.data.documents[index];
                Map<String, dynamic> data = document.data;
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(width: 1.0, color: Colors.black26))),
                      child: Text (data['kelas'],style: TextStyle(fontSize: 16),),
                    ),
                    title: Text(
                      data['nama'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Icon(Icons.pin_drop, color: Colors.grey),
                        SafeArea(child: Text(data['tempat'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                        SizedBox(width: 10,),
                        Icon(Icons.timer, color: Colors.grey),
                        SafeArea(child: Text(data['jam'], style: TextStyle(color: Colors.black54,fontSize: 12.0))),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    )
);



class _JadwalState extends State<Jadwal> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: SilabColor.tertiary,
        ),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(height: 10,),
            SlimyCard(
              slimeEnabled: false,
              color: const Color (0xff5858FF),
              width: 400,
              topCardHeight: 200,
              bottomCardHeight: 400,
              topCardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Text('Jadwal Hari Senin',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 20,
                                fontWeight: FontWeight.bold))),
                  ]),
             bottomCardWidget: makebody),
            SizedBox(height: 10,),
            SlimyCard(
                slimeEnabled: false,
                color: const Color (0xffFFD700),
                width: 400,
                topCardHeight: 200,
                bottomCardHeight: 400,
                topCardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text('Jadwal Hari Selasa',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                    ]),
                bottomCardWidget: makebody2),
            SizedBox(height: 10,),
            SlimyCard(
                slimeEnabled: false,
                color: const Color (0xffFF69B4),
                width: 400,
                topCardHeight: 200,
                bottomCardHeight: 400,
                topCardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text('Jadwal Hari Rabu',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                    ]),
                bottomCardWidget: makebody3),
            SizedBox(height: 10,),
            SlimyCard(
                slimeEnabled: false,
                color: const Color (0xffFF8C00),
                width: 400,
                topCardHeight: 200,
                bottomCardHeight: 400,
                topCardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text('Jadwal Hari Kamis',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                    ]),
                bottomCardWidget: makebody4),

            SizedBox(height: 10,),
            SlimyCard(
                slimeEnabled: false,
                color: const Color (0xff5858FF),
                width: 400,
                topCardHeight: 200,
                bottomCardHeight: 400,
                topCardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text('Jadwal Hari Jumat',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                    ]),
                bottomCardWidget: makebody5),
            SizedBox(height: 10,),
            SlimyCard(
                slimeEnabled: false,
                color: const Color (0xffFFC0CB),
                width: 400,
                topCardHeight: 200,
                bottomCardHeight: 400,
                topCardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text('Jadwal Hari Sabtu',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold))),
                    ]),
                bottomCardWidget: makebody6),
          ],
        )
        );

  }
}