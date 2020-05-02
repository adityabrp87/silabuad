import 'package:cloud_firestore/cloud_firestore.dart';

bool status;
final Firestore firestore = Firestore.instance;
void getData() {
  firestore
      .collection('status').document('daftar').get().then((val){
    status = val.data['status'];
  });
}