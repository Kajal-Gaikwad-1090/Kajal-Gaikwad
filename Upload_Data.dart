import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:garden_app/resource/add_data.dart';
import 'package:garden_app/screens/Qrcodescreen.dart';
import 'package:garden_app/utils/color_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key, required this.title});

  final String title;

  @override
  State<UploadScreen> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadScreen> {
  Uint8List? _image;
  String data = 'null';
  String result = 'null';
  final TextEditingController rname = TextEditingController();
  final TextEditingController direction = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController price = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveProfile() async {
    String name = rname.text;
    String des = description.text;
    String dir = direction.text;

    // String resp = await StoreData().saveData(
    //     // rname: name,
    //     // description: des,
    //     // direction: dir,
    //     // price: pri,
    //     file: _image!);
  }

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
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://cdn-icons-png.flaticon.com/512/219/219983.png'),
                          ),
                    Positioned(
                      bottom: -20,
                      left: 90,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: rname,
                  decoration: InputDecoration(
                    hintText: 'Enter Spot Name',
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: direction,
                  decoration: InputDecoration(
                    hintText: 'Enter Direction',
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: description,
                  decoration: InputDecoration(
                    hintText: 'Enter Description',
                    contentPadding: EdgeInsets.all(10),
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                // SizedBox(height: 10),
                // TextField(
                //   controller: price,
                //   decoration: InputDecoration(
                //     hintText: 'Enter Price',
                //     contentPadding: EdgeInsets.all(10),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // ElevatedButton(
                //   onPressed: saveProfile,
                //   child: Text("Upload Data"),
                // ),
                ElevatedButton(
                  onPressed: () {
                    String data =
                        "Spot Name: ${rname.text} Direction: ${direction.text} Description: ${description.text}";

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => Qrcode(data: data))));
                  },
                  child: Text("Qrcode Genrate"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
