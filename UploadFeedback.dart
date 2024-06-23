import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadFeedback extends StatefulWidget {
  const UploadFeedback({super.key});

  @override
  State<UploadFeedback> createState() => _UploadFeedbackState();
}

class _UploadFeedbackState extends State<UploadFeedback> {
  var namecontroller = new TextEditingController();
  var descontroller = new TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/garden.jpg"), fit: BoxFit.cover),
      ),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Text("Adult" + widget.adult),
            // Text("Child" + widget.child),
            const SizedBox(
              height: 20,
            ),
            // datakey = widget.data,
            const Text(
              "Upload User Info",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: descontroller,
                decoration: const InputDecoration(
                  hintText: 'Feedback',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 15,
            ),

            OutlinedButton(
                onPressed: () {
                  insertData(
                    namecontroller.text,
                    descontroller.text,
                  );
                },
                child: Text(
                  "Upload Feedback",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      )),
    ));
  }

  void insertData(String name, String fedback) {
    databaseRef.child("feedback").push().set({
      'place': name,
      'feedback': fedback,
    });
    // namecontroller.clear();
    // childcontroller.clear();
    // addresscontroller.clear();
    // adultcontroller.clear();

    Fluttertoast.showToast(msg: "Save Data", toastLength: Toast.LENGTH_SHORT);
  }
}
