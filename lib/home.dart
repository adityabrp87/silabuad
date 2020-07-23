import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'kelas.dart';
import 'info.dart';
import 'jadwal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in.dart' as sign;
import 'main.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  final _pageOptions = [KelasPage(),Info(),Jadwal()];

  Widget title (){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'SI',
          style: GoogleFonts.portLligatSans(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'Lab',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ]
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff4A91F2),
          title: Row(
            children: <Widget>[
              title(),
              Expanded(child: Container(), ),
              FlatButton(
                child: Text('Keluar',style: TextStyle(fontSize: 16.0,color: Colors.white),),
                onPressed: () { sign.signOutGoogle();Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );}
              )
            ],
          ),
        ),
        body: _pageOptions[currentPage],
        bottomNavigationBar: FancyBottomNavigation(
            circleColor: Color(0xff4A91F2),
            activeIconColor: Colors.white,
            inactiveIconColor:Color(0xff4A91F2),
            tabs: [
              TabData(iconData: Icons.class_,title: "Kelas"),
              TabData(iconData: Icons.info,title:"Info"),
              TabData(iconData: Icons.library_books,title: "Jadwal")
            ],
            onTabChangedListener: (int position){
              setState(() {
                currentPage = position;
              });
            }
        ),
      ),
    );
  }
}