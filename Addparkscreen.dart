import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garden_app/screens/Qrcodescreen.dart';

class AddParkScreen extends StatefulWidget {
  const AddParkScreen({super.key});

  @override
  State<AddParkScreen> createState() => _AddParkScreenState();
}

class _AddParkScreenState extends State<AddParkScreen> {
  var namecontroller = new TextEditingController();
  var descontroller = new TextEditingController();
  var addresscontroller = new TextEditingController();
  var timecontroller = new TextEditingController();
  var rightconyroller = new TextEditingController();
  var frontcontroller = new TextEditingController();
  var backcontroller = new TextEditingController();

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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: namecontroller,
                  decoration: const InputDecoration(
                    hintText: 'Place Name',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  controller: addresscontroller,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  controller: timecontroller,
                  decoration: const InputDecoration(
                    hintText: 'Left',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  controller: rightconyroller,
                  decoration: const InputDecoration(
                    hintText: 'Right',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  controller: frontcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Front',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  controller: backcontroller,
                  decoration: const InputDecoration(
                    hintText: 'Back',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  String data =
                      "Place Name: ${namecontroller.text} Description: ${addresscontroller.text} Left: ${timecontroller.text}  Right:${rightconyroller.text}  Front:${frontcontroller.text}  Back:${backcontroller.text}";

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => Qrcode(data: data))));
                },
                child: Text("Qrcode Genrate"),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
