import 'package:flutter/material.dart';
import './jadwal.dart' as jadwal;
import './kelas.dart' as kelas;
import './info.dart' as info;
import './home.dart';
import 'package:silabuad/sign_in.dart';
import './landing.dart';
import 'clipper.dart';
import 'sign_in.dart' as sign;
import 'package:google_fonts/google_fonts.dart';

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
  Widget title (){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'SI',
          style: GoogleFonts.portLligatSans(
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Color(0xff4A91F2),
          ),
          children: [
            TextSpan(
              text: 'Lab',
              style: TextStyle(color: Color(0xff64A1F4), fontSize: 50),
            )
          ]
      ),
    );
  }
  Widget email (){
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff4A91F2),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('G',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            flex: 5,
            child: FlatButton(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff64A1F4),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text('Masuk dengan email UAD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ),
              onPressed: () {
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
            ),
          ),
        ],
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold (
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: SizedBox(height: height * .3)),
                      title(),
                      Text('Silahkan masuk dengan email UAD',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.blueGrey),),
                      SizedBox(height: 50),
                      email(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
