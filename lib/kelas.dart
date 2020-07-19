import 'package:flutter/material.dart';
import 'package:silabuad/variabelColor.dart';
import './sign_in.dart' as sign;
import './variabelColor.dart';
import './daftar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './status_daftar.dart';

class KelasPage extends StatefulWidget {
  @override
  _KelasPageState createState() => new _KelasPageState();
}

class _KelasPageState extends State<KelasPage>{

  Future<void> _dialog(BuildContext context) {
    getData();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: status==true? FlatButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Daftar();
                  },
                ),
              );
            },
            child: Text('Daftar', style: TextStyle(fontSize: 20.0)),
          ) :
          Text('Belum masa KRS praktikum'),
          actions: <Widget>[
            FlatButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold (
      floatingActionButton: FloatingActionButton (
        onPressed: ()=> _dialog(context) ,
        child : Icon(Icons.add,color: SilabColor.primary,),
        backgroundColor : Colors.white,
      ),

//      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      body: Container(
        decoration: BoxDecoration(
          color: SilabColor.tertiary,
        ),
      ),
    );
  }
}