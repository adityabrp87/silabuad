import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:silabuad/status_daftar.dart';
import 'package:flutter/material.dart';
import './home.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
String nama;
String nim;


Future<String> signIn() async {
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: gSA.accessToken,
    idToken: gSA.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;


  // Checking if email and name is null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;

  //ambil nama depan saja
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  
  final firestoreInstance= Firestore.instance;
  var firebaseUser = await FirebaseAuth.instance.currentUser();


  firestoreInstance.collection('users').document(firebaseUser.uid).get().then((val){
    nama = val.data['nama'];
    nim = val.data['nim'];
  });


  return 'signInWithGoogle succeeded: $user';
}

Future<void> dialog(BuildContext context) {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _nama1;
  String _nim1;

  void pushData() async {
    final firestoreInstance= Firestore.instance;
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    firestoreInstance.collection('users').document(firebaseUser.uid).setData({
      'nama' : _nama1,
      'nim' : _nim1,
      "email" : email,

    }).then((_) {
      print('success');
    } );
  }

  void validateinput(){
    if (_formKey.currentState.validate()){
      _formKey.currentState.save();
      pushData(); Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ),
      );
      print(_nama1); print(_nim1);
    }
    else {

        _autoValidate = true;

    }
  }
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: Container(
            width: 300.0,
            height: 160.0,
            child: ListView(
              children: <Widget>[
                Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      width: 400.0,
                      height: 35.0,
                      child: Text('Masukkan nama dan nim anda',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                    )
                ),
                Padding(padding: new EdgeInsets.only(top: 10.0),),
                Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      width: 400.0,
                      height: 35.0,
                      child: TextFormField(
                        validator: validNama,
                        onSaved: (String val) {
                          _nama1 = val;
                        },
                        style: TextStyle(fontSize: 16.0,),
                        decoration: InputDecoration(
                            hintText: 'masukkan nama lengkap',
                            hintStyle: TextStyle(fontSize: 14.0),
                            enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey , width:2.0
                                )
                            ),
                            focusedBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey , width:2.0
                                )
                            )
                        ),
                      ),
                    )
                ),
                Padding(padding: new EdgeInsets.only(top: 20.0),),
                Align(
                    alignment: Alignment(0,0),
                    child: Container(
                      width: 400.0,
                      height: 35.0,
                      child: TextFormField(
                        validator: validNim,
                        onSaved: (String val) {
                          _nim1 = val;
                        },
                        style: TextStyle(fontSize: 16.0,),
                        decoration: InputDecoration(
                            hintText: 'masukkan NIM',
                            hintStyle: TextStyle(fontSize: 14.0),
                            enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey , width:2.0
                                )
                            ),
                            focusedBorder: new OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey , width:2.0
                                )
                            )
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),

        ),
        actions: <Widget>[
          FlatButton(
            child: Text('selesai'),
            onPressed: () =>  validateinput()
          ),
        ],
      );
    },
  );
}


String validNama(String value) {
  if (value.length < 4)
    return 'Nama harus lebih dari 3 karakter';
  else
    return null;
}

String validNim(String value) {
  Pattern number =
      r'^(?:[+0]9)?[0-9]{10}$';
  RegExp regnumber= new RegExp(number);
  if (regnumber.hasMatch(value))
    return null;
  else
    return 'Masukkan NIM yang valid';
}



void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}