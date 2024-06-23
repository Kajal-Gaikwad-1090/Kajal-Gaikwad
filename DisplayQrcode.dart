import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DisplayQrcode extends StatefulWidget {
  const DisplayQrcode({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  State<DisplayQrcode> createState() => _DisplayQrcodeState();
}

class _DisplayQrcodeState extends State<DisplayQrcode> {
  var res;
  var name;
  var price;
  var address;
  var status;

  Query dbRef = FirebaseDatabase.instance
      .ref()
      .child('ticket')
      .orderByChild('name')
      .equalTo("madhuri");
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('ticket');

  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 500,
      // color: Color.fromARGB(255, 202, 200, 211),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   student['name'],
          //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          // ),
          // Text(
          //   "Description: " + student['address'],
          //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          // ),
          // Text(
          //   "Address: " + student['status'],
          //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          // ),
          // Text(
          //   "Time: " + student['price'],
          //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          // ),
          QrImageView(
            // ignore: prefer_interpolation_to_compose_strings
            data: "User Name- " +
                student['name'] +
                "  Price- " +
                student['price'] +
                "  Status" +
                student['status'] +
                "  Transactio Id- " +
                student['address'],
            backgroundColor: Colors.white,
            size: 300.00,
          ),
        ],
      ),
    );
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
      // height: double.infinity,
      child: FirebaseAnimatedList(
        query: FirebaseDatabase.instance
            .ref()
            .child('ticket')
            .orderByChild('name')
            .equalTo(widget.data),
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map student = snapshot.value as Map;
          student['key'] = snapshot.key;
          name = student['name'];
          price = student['price'];
          print(name);
          return listItem(student: student);
        },
      ),
    ));
  }
}
