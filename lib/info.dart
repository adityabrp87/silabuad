import 'package:flutter/material.dart';
import 'package:silabuad/variabelColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Info extends StatelessWidget {
  final Firestore firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: SilabColor.tertiary,
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: firestore.collection('info').orderBy('tanggal', descending: true).snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (!snapshot.hasData) {
              return Text ('Loading silahkan tunggu');
            }
            return ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index){
                  DocumentSnapshot document = snapshot.data.documents[index];
                  Map<String, dynamic> info = document.data;
                  return Card(
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: SilabColor.primary
                          ),
                          child:
                          Align(
                            alignment: Alignment(0, 0),
                            child: Text(info['judul'], style: TextStyle(fontSize: 17.0),),
                          ),
                          ),
                        Padding(padding: new EdgeInsets.only(top: 10.0),),
                        Container(
                          width: double.infinity,
                          child: Text(
                            info['isi'],style: TextStyle(fontSize: 15.0),
                            maxLines: 50, overflow: TextOverflow.fade,
                          )
                        ),
                        Padding(padding: new EdgeInsets.only(top: 15.0),),
                        Container(
                            width: double.infinity,
                            child: Row (
                              children: <Widget>[
                                Text(info['tanggal'], style: TextStyle(fontSize: 11.0),),
                                Expanded(child:Container()),
                                Text(info['author'], style: TextStyle(fontSize: 11.0),)
                              ],
                            )
                        ),
                      ],
                    )
                  );
                }
            );
          }
        )
      ),
    );
  }
}