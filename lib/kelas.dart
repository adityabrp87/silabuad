import 'package:flutter/material.dart';
import 'variabelColor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart' as sign;

class KelasPage extends StatefulWidget {
  @override
  _KelasPageState createState() => _KelasPageState();
}
final makebody = Container(
  child: StreamBuilder<QuerySnapshot>(
    stream: Firestore.instance.collection('kelas').where('uid', isEqualTo: sign.uid).snapshots(),
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
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot document = snapshot.data.documents[index];
                  Map<String, dynamic> data = document.data;
            return Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
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
                      Icon(Icons.people, color: Colors.grey),
                      SafeArea(child: Text(data['dosen'], style: TextStyle(color: Colors.black54,fontSize: 12.0)))
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
  )
);


class _KelasPageState extends State<KelasPage> {
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


