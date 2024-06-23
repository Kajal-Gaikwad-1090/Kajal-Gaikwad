import 'dart:typed_data';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garden_app/resource/add_data.dart';
import 'package:garden_app/utils/color_utils.dart';
import 'package:image_picker/image_picker.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({super.key});

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  Uint8List? _image;

  String result = 'null';
  String scandata = '';
  final TextEditingController rname = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String name = namecontroller.text;
    String address = addresscontroller.text;
    String descr = descontroller.text;
    String time = timecontroller.text;
    String adult = adultcontroller.text;
    String child = childcontroller.text;

    String resp = await StoreData().saveData(
        name: name,
        address: address,
        description: descr,
        time: time,
        adult: adult,
        child: child,
        file: _image!);
  }

  var namecontroller = new TextEditingController();
  var descontroller = new TextEditingController();
  var addresscontroller = new TextEditingController();
  var timecontroller = new TextEditingController();
  var adultcontroller = new TextEditingController();
  var childcontroller = new TextEditingController();

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/garden.jpg"),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      _image != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: MemoryImage(_image!),
                            )
                          : const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/219/219983.png'),
                            ),
                      Positioned(
                        bottom: -20,
                        left: 70,
                        child: IconButton(
                          onPressed: selectImage,
                          icon: Icon(Icons.add_a_photo),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: 'Place Name',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: addresscontroller,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: timecontroller,
                    decoration: InputDecoration(
                      hintText: 'Time',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: descontroller,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: adultcontroller,
                    decoration: InputDecoration(
                      hintText: 'Child Price',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    controller: childcontroller,
                    decoration: InputDecoration(
                      hintText: 'Adult Price',
                      contentPadding: EdgeInsets.all(10),
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        saveProfile();
                      },
                      child: Text(
                        "Upload",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void insertData(
      String name, String description, String address, String time) {
    databaseRef.child("info").push().set({
      'name': name,
      'address': address,
      'description': description,
      'time': time
    });
    namecontroller.clear();
    timecontroller.clear();
    addresscontroller.clear();
    descontroller.clear();

    Fluttertoast.showToast(msg: "Save Data", toastLength: Toast.LENGTH_SHORT);
  }
}
