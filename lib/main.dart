import 'package:flutter/material.dart';
import 'package:silabuad/variabelColor.dart';
import './jadwal.dart' as jadwal;
import './kelas.dart' as kelas;
import './info.dart' as info;
import './home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'package:silabuad/sign_in.dart';
import './landing.dart';

void main(){
  runApp(new MaterialApp(
    title: "SILAB",
    home: new LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image/silab.png'),
            Padding (padding: EdgeInsets.only(bottom: 30.0),),
            InkWell(
              onTap: (){
                signIn().whenComplete(() {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return Landing();
                      },
                    ),
                  );
                });
              },
                child: Image.asset('assets/image/log.png', width: 350.0,)),

          ],
        ),
      )
    );
  }
}
