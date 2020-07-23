import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'variabelColor.dart';

class Info extends StatefulWidget {

  @override
  _InfoState createState() => _InfoState();
}

final makebody = Container(
  decoration: BoxDecoration(
    color: SilabColor.tertiary,
  ),
  child: StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('info').orderBy('tanggal', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: snapshot.data.documents.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot document = snapshot.data.documents[index];
            Map<String, dynamic> info = document.data;
            return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child:ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  title: Center(
                    child: Text(
                      info['judul'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                  subtitle: Column(
                    children: <Widget>[
                      Padding(padding: new EdgeInsets.only(top: 30.0),),
                      SafeArea(
                        child: Text(info['isi'],
                            style: TextStyle(color: Colors.black54)),
                      ),
                      Padding(padding: new EdgeInsets.only(top: 15.0),),
                      Row(
                        children: <Widget>[
                          Icon(Icons.people, color: Colors.black54),
                          Text(info['author'], style: TextStyle(color: Colors.black54)),
                          SizedBox(width: 10,),
                          Icon(Icons.date_range, color: Colors.black54),
                          Text(info['tanggal'], style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
  ),
);





class _InfoState extends State<Info> {
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
        child: makebody);
  }
}