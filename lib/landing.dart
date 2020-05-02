import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './sign_in.dart' as sign;
import './variabelColor.dart';
import './home.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: SilabColor.tertiary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Selamat Datang',style: TextStyle(fontSize: 40.0,color: Colors.white),),
            Text('Di Silab',style: TextStyle(fontSize: 40.0,color: Colors.white),),
            Padding(padding: new EdgeInsets.only(top: 60.0),),
            CircleAvatar(
              backgroundImage: NetworkImage(
                sign.imageUrl,
              ),
              radius: 85,
              backgroundColor: Colors.transparent,
            ),
            Padding(padding: new EdgeInsets.only(top: 30.0),),
            Text('Anda masuk dengan email',style: TextStyle(fontSize: 18.0,color: Colors.white),),
            Text(sign.email,style: TextStyle(fontSize: 18.0,color: Colors.white),),
            Padding(padding: new EdgeInsets.only(top: 40.0),),
            RaisedButton(
              color: SilabColor.primary,
              child: Text('Lanjutkan',style: TextStyle(fontSize: 18.0,color: Colors.white),),
              onPressed: () => sign.nama==null&&sign.nim==null ?sign.dialog(context):Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Home();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
