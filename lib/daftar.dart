import 'package:flutter/material.dart';
import 'package:silabuad/variabelColor.dart';
import './sign_in.dart' as sign;
import './variabelColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
class Daftar extends StatefulWidget {
  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  CollectionReference firestore = Firestore.instance.collection('matkul');
  CollectionReference firestore1 = Firestore.instance.collection('matkul');
  List jadwal = [{}];

  String nama;
  String dosen;
  String kelas;
  bool select = true;

  void _handleTap() {
    setState(() {
      select = !select;
      if (!select){
        jadwal.add(nama);
        jadwal.add(dosen);
        jadwal.add(kelas);
      }
      else {
        jadwal.remove(nama);
        jadwal.remove(dosen);
        jadwal.remove(kelas);
      }
      print(jadwal);
    });
  }
  Widget build(BuildContext context) {
   return Scaffold (
     body : Container (
       height: double.infinity,
       width: double.infinity,
       decoration: BoxDecoration(
         color: SilabColor.tertiary,
       ),
       child: ListView(
         shrinkWrap: true,
         children: <Widget>[
           Padding(padding: new EdgeInsets.only(top: 10.0),),
          Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Silahkan pilih jadwal', style: TextStyle(fontSize: 23.0,fontFamily: 'GraphicRegular',color: Colors.white),),
              Text('yang anda inginkan', style: TextStyle(fontSize: 23.0,fontFamily: 'GraphicRegular',color:Colors.white),),
            ],
          ),
           Padding(padding: new EdgeInsets.only(top: 40.0),),


               Container(
                 width : 300.0,
                 height: 60.0,
                 decoration: BoxDecoration(
                   color: SilabColor.primary,
                 ),
                 child: Align(
                   alignment: Alignment(0, 0),
                     child : Text('Senin',style: TextStyle(fontFamily: 'GraphicRegular',fontSize: 20.0,color: Colors.white),)
                 ),
               ),
               StreamBuilder<QuerySnapshot>(
                   stream: firestore.where("hari", isEqualTo: 'senin').orderBy('waktu').snapshots(),
                   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                     if (!snapshot.hasData) {
                       return Center(child: CircularProgressIndicator());
                     }
                     return ListView.builder(
                       shrinkWrap: true,
                         padding: EdgeInsets.all(8.0),
                         itemCount: snapshot.data.documents.length,
                         itemBuilder: (BuildContext context, int index){
                           DocumentSnapshot document = snapshot.data.documents[index];
                           Map<String, dynamic> info = document.data;
                           nama=info['nama'];
                           dosen=info['dosen'];
                           kelas=info['kelas'];
                           return Card(
                               elevation: 8.0,
                               margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                               child : GestureDetector(
                                 onTap: _handleTap,
                                 child: Container(
//                                   width: double.infinity,
                                   decoration: BoxDecoration(
                                     color: select ? Colors.white : Colors.grey,
                                   ),
                                   child: ListTile(

                                     leading: Container(height:50.0,width:30.0,child: Text(info['kelas'],style: TextStyle(fontSize: 30.0,fontFamily: 'GraphicRegular'),)),
                                     title: Row(
                                       children: <Widget>[
                                         Text ( info['nama'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                         Expanded(child: Container(),),
                                         Text ( info['ruang'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                       ],
                                     ),
                                     subtitle: Row(children: <Widget>[
                                       Text(info['waktu'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                                       Expanded(child: Container(),),
                                       Text ( info['dosen'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                                     ],
                                     ),
                                   ),
                                 ),
                               ),
                           );
                         }
                     );
                   }
               ),
           Padding(padding: new EdgeInsets.only(top: 20.0),),
           Container(
             width : 300.0,
             height: 60.0,
             decoration: BoxDecoration(
               color: SilabColor.primary,
             ),
             child: Align(
                 alignment: Alignment(0, 0),
                 child : Text('Selasa',style: TextStyle(fontFamily: 'GraphicRegular',fontSize: 20.0,color: Colors.white),)
             ),
           ),
           StreamBuilder<QuerySnapshot>(
               stream: firestore1.where("hari", isEqualTo: "selasa").orderBy('waktu').snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 if (!snapshot.hasData) {
                   return Center(child: CircularProgressIndicator());
                 }
                 return ListView.builder(
                     shrinkWrap: true,
                     padding: EdgeInsets.all(8.0),
                     itemCount: snapshot.data.documents.length,
                     itemBuilder: (BuildContext context, int index){
                       DocumentSnapshot document = snapshot.data.documents[index];
                       Map<String, dynamic> info1 = document.data;
                       return Card(
                         elevation: 8.0,
                         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                         child : GestureDetector(
                           onTap: _handleTap,
                           child: Container(
//                                   width: double.infinity,
                             decoration: BoxDecoration(
                               color: select ? Colors.white : Colors.grey,
                             ),
                             child: ListTile(

                               leading: Container(height:50.0,width:30.0,child: Text(info1['kelas'],style: TextStyle(fontSize: 30.0,fontFamily: 'GraphicRegular'),)),
                               title: Row(
                                 children: <Widget>[
                                   Text ( info1['nama'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                   Expanded(child: Container(),),
                                   Text ( info1['ruang'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                 ],
                               ),
                               subtitle: Row(children: <Widget>[
                                 Text(info1['waktu'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                                 Expanded(child: Container(),),
                                 Text ( info1['dosen'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                               ],
                               ),
                             ),
                           ),
                         ),
                       );
                     }
                 );
               }
           ),

           Padding(padding: new EdgeInsets.only(top: 20.0),),
           Container(
             width : 300.0,
             height: 60.0,
             decoration: BoxDecoration(
               color: SilabColor.primary,
             ),
             child: Align(
                 alignment: Alignment(0, 0),
                 child : Text('Rabu',style: TextStyle(fontFamily: 'GraphicRegular',fontSize: 20.0,color: Colors.white),)
             ),
           ),
           StreamBuilder<QuerySnapshot>(
               stream: firestore.where("hari", isEqualTo: 'rabu').orderBy('waktu').snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 if (!snapshot.hasData) {
                   return Center(child: CircularProgressIndicator());
                 }
                 return ListView.builder(
                     shrinkWrap: true,
                     padding: EdgeInsets.all(8.0),
                     itemCount: snapshot.data.documents.length,
                     itemBuilder: (BuildContext context, int index){
                       DocumentSnapshot document = snapshot.data.documents[index];
                       Map<String, dynamic> info = document.data;
                       nama=info['nama'];
                       dosen=info['dosen'];
                       kelas=info['kelas'];
                       return Card(
                         elevation: 8.0,
                         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                         child : GestureDetector(
                           onTap: _handleTap,
                           child: Container(
//                                   width: double.infinity,
                             decoration: BoxDecoration(
                               color: select ? Colors.white : Colors.grey,
                             ),
                             child: ListTile(

                               leading: Container(height:50.0,width:30.0,child: Text(info['kelas'],style: TextStyle(fontSize: 30.0,fontFamily: 'GraphicRegular'),)),
                               title: Row(
                                 children: <Widget>[
                                   Text ( info['nama'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                   Expanded(child: Container(),),
                                   Text ( info['ruang'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                 ],
                               ),
                               subtitle: Row(children: <Widget>[
                                 Text(info['waktu'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                                 Expanded(child: Container(),),
                                 Text ( info['dosen'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                               ],
                               ),
                             ),
                           ),
                         ),
                       );
                     }
                 );
               }
           ),

           Padding(padding: new EdgeInsets.only(top: 20.0),),
           Container(
             width : 300.0,
             height: 60.0,
             decoration: BoxDecoration(
               color: SilabColor.primary,
             ),
             child: Align(
                 alignment: Alignment(0, 0),
                 child : Text('Kamis',style: TextStyle(fontFamily: 'GraphicRegular',fontSize: 20.0,color: Colors.white),)
             ),
           ),
           StreamBuilder<QuerySnapshot>(
               stream: firestore.where("hari", isEqualTo: 'kamis').orderBy('waktu').snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 if (!snapshot.hasData) {
                   return Center(child: CircularProgressIndicator());
                 }
                 return ListView.builder(
                     shrinkWrap: true,
                     padding: EdgeInsets.all(8.0),
                     itemCount: snapshot.data.documents.length,
                     itemBuilder: (BuildContext context, int index){
                       DocumentSnapshot document = snapshot.data.documents[index];
                       Map<String, dynamic> info = document.data;
                       nama=info['nama'];
                       dosen=info['dosen'];
                       kelas=info['kelas'];
                       return Card(
                         elevation: 8.0,
                         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                         child : GestureDetector(
                           onTap: _handleTap,
                           child: Container(
//                                   width: double.infinity,
                             decoration: BoxDecoration(
                               color: select ? Colors.white : Colors.grey,
                             ),
                             child: ListTile(

                               leading: Container(height:50.0,width:30.0,child: Text(info['kelas'],style: TextStyle(fontSize: 30.0,fontFamily: 'GraphicRegular'),)),
                               title: Row(
                                 children: <Widget>[
                                   Text ( info['nama'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                   Expanded(child: Container(),),
                                   Text ( info['ruang'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                 ],
                               ),
                               subtitle: Row(children: <Widget>[
                                 Text(info['waktu'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                                 Expanded(child: Container(),),
                                 Text ( info['dosen'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                               ],
                               ),
                             ),
                           ),
                         ),
                       );
                     }
                 );
               }
           ),

           Padding(padding: new EdgeInsets.only(top: 20.0),),
           Container(
             width : 300.0,
             height: 60.0,
             decoration: BoxDecoration(
               color: SilabColor.primary,
             ),
             child: Align(
                 alignment: Alignment(0, 0),
                 child : Text('Jumat',style: TextStyle(fontFamily: 'GraphicRegular',fontSize: 20.0,color: Colors.white),)
             ),
           ),
           StreamBuilder<QuerySnapshot>(
               stream: firestore.where("hari", isEqualTo: 'jumat').orderBy('waktu').snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 if (!snapshot.hasData) {
                   return Center(child: CircularProgressIndicator());
                 }
                 return ListView.builder(
                     shrinkWrap: true,
                     padding: EdgeInsets.all(8.0),
                     itemCount: snapshot.data.documents.length,
                     itemBuilder: (BuildContext context, int index){
                       DocumentSnapshot document = snapshot.data.documents[index];
                       Map<String, dynamic> info = document.data;
                       nama=info['nama'];
                       dosen=info['dosen'];
                       kelas=info['kelas'];
                       return Card(
                         elevation: 8.0,
                         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                         child : GestureDetector(
                           onTap: _handleTap,
                           child: Container(
//                                   width: double.infinity,
                             decoration: BoxDecoration(
                               color: select ? Colors.white : Colors.grey,
                             ),
                             child: ListTile(

                               leading: Container(height:50.0,width:30.0,child: Text(info['kelas'],style: TextStyle(fontSize: 30.0,fontFamily: 'GraphicRegular'),)),
                               title: Row(
                                 children: <Widget>[
                                   Text ( info['nama'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                   Expanded(child: Container(),),
                                   Text ( info['ruang'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                 ],
                               ),
                               subtitle: Row(children: <Widget>[
                                 Text(info['waktu'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                                 Expanded(child: Container(),),
                                 Text ( info['dosen'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                               ],
                               ),
                             ),
                           ),
                         ),
                       );
                     }
                 );
               }
           ),

           Padding(padding: new EdgeInsets.only(top: 20.0),),
           Container(
             width : 300.0,
             height: 60.0,
             decoration: BoxDecoration(
               color: SilabColor.primary,
             ),
             child: Align(
                 alignment: Alignment(0, 0),
                 child : Text('Sabtu',style: TextStyle(fontFamily: 'GraphicRegular',fontSize: 20.0,color: Colors.white),)
             ),
           ),
           StreamBuilder<QuerySnapshot>(
               stream: firestore.where("hari", isEqualTo: 'sabtu').orderBy('waktu').snapshots(),
               builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                 if (!snapshot.hasData) {
                   return Center(child: CircularProgressIndicator());
                 }
                 return ListView.builder(
                     shrinkWrap: true,
                     padding: EdgeInsets.all(8.0),
                     itemCount: snapshot.data.documents.length,
                     itemBuilder: (BuildContext context, int index){
                       DocumentSnapshot document = snapshot.data.documents[index];
                       Map<String, dynamic> info = document.data;
                       nama=info['nama'];
                       dosen=info['dosen'];
                       kelas=info['kelas'];
                       return Card(
                         elevation: 8.0,
                         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                         child : GestureDetector(
                           onTap: _handleTap,
                           child: Container(
//                                   width: double.infinity,
                             decoration: BoxDecoration(
                               color: select ? Colors.white : Colors.grey,
                             ),
                             child: ListTile(

                               leading: Container(height:50.0,width:30.0,child: Text(info['kelas'],style: TextStyle(fontSize: 30.0,fontFamily: 'GraphicRegular'),)),
                               title: Row(
                                 children: <Widget>[
                                   Text ( info['nama'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                   Expanded(child: Container(),),
                                   Text ( info['ruang'],style: TextStyle(fontSize: 13.0,fontFamily: 'GraphicRegular'),),
                                 ],
                               ),
                               subtitle: Row(children: <Widget>[
                                 Text(info['waktu'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                                 Expanded(child: Container(),),
                                 Text ( info['dosen'],style: TextStyle(fontSize: 11.0,fontFamily: 'GraphicRegular'),),
                               ],
                               ),
                             ),
                           ),
                         ),
                       );
                     }
                 );
               }
           ),
         ],
       ),
     ) ,
   );
  }
}
