import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
String downloadUrl = "";

class StoreData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    // String str = String.fromCharCodes(file);
    UploadTask uploadtask = ref.putData(file);
    TaskSnapshot snapshot = await uploadtask;
    downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> saveData({
    required String name,
    required String description,
    required String time,
    required String address,
    required String adult,
    required String child,
    required Uint8List file,
  }) async {
    String resp = "Error is Occured";
    try {
      if (name.isNotEmpty ||
          description.isNotEmpty ||
          file.isNotEmpty ||
          time.isNotEmpty ||
          address.isNotEmpty ||
          adult.isNotEmpty) {
        String imageurl = await uploadImageToStorage('image', file);

        // await _firestore
        //     .collection('complaint')
        //     .add({'comp': rname, 'dustibinid': description, 'imageurl': file});\

        final databaseRef = FirebaseDatabase.instance.reference();
        databaseRef.child("palce").push().set({
          'imageurl': imageurl,
          'place': name,
          'desc': description,
          'address': address,
          'time': time,
          'adult': adult,
          'child': child
        });

        resp = 'Success';
        Fluttertoast.showToast(
          msg: "Upload Successfully",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (err) {
      resp = err.toString();
    }

    return resp;
  }
}
