import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garden_app/screens/DisplayQrcode.dart';
import 'package:garden_app/screens/Qrcodescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoScreen extends StatefulWidget {
  var adult;
  var child;

  UserInfoScreen({Key? myKey, this.adult, this.child}) : super(key: myKey);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  var namecontroller = new TextEditingController();
  var childcontroller = new TextEditingController();
  var addresscontroller = new TextEditingController();
  var adultcontroller = new TextEditingController();
  var result;
  var childprice;
  var cprice;
  var chprice;
  var adultprice;
  var adprice;
  var aprice;
  var tprice;
  var totalprice;

  var datakey;

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
                controller: addresscontroller,
                decoration: const InputDecoration(
                  hintText: 'Transaction Id',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: adultcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'No Of Adult',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                controller: childcontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'No Of Child',
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                )),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
                onPressed: () {
                  childprice = childcontroller.text.toString();
                  cprice = int.parse(childprice);
                  chprice = int.parse(widget.child);
                  print(cprice * chprice);
                  adultprice = adultcontroller.text.toString();
                  aprice = int.parse(adultprice);
                  adprice = int.parse(widget.adult);
                  print(aprice * adprice);
                  tprice = (cprice * chprice) + (aprice * adprice);
                  print(tprice);
                  totalprice = tprice.toString();

                  if (namecontroller.text.isNotEmpty &&
                      childcontroller.text.isNotEmpty &&
                      addresscontroller.text.isNotEmpty) {
                    insertData(
                        namecontroller.text,
                        childcontroller.text,
                        addresscontroller.text,
                        adultcontroller.text,
                        totalprice);
                  }
                },
                child: Text(
                  "Upload Data",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                // final SharedPreferences pref =
                //     SharedPreferences.getInstance() as SharedPreferences;
                // result = pref.getString('email');
                // Fluttertoast.showToast(msg: result);
                print(namecontroller.text);
                // String data =
                //     "User Name: ${namecontroller.text} Address: ${addresscontroller.text} Price: ${totalprice}";
                String data = namecontroller.text.toString();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => DisplayQrcode(data: data))));
              },
              child: Text("Qrcode Genrate"),
            ),
          ],
        ),
      )),
    ));
  }

  void insertData(
      String name, String child, String address, String adult, String price) {
    databaseRef.child("ticket").push().set({
      'name': name,
      'address': address,
      'child': child,
      'adult': adult,
      'price': price,
      'status': "nonapproved"
    });
    // namecontroller.clear();
    // childcontroller.clear();
    // addresscontroller.clear();
    // adultcontroller.clear();

    Fluttertoast.showToast(msg: "Save Data", toastLength: Toast.LENGTH_SHORT);
  }
}
