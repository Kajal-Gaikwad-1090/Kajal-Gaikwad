import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateRecodeScreen extends StatefulWidget {
  const UpdateRecodeScreen({Key? key, required this.studentkey})
      : super(key: key);

  final String studentkey;

  @override
  State<UpdateRecodeScreen> createState() => _UpdateRecodeScreenState();
}

class _UpdateRecodeScreenState extends State<UpdateRecodeScreen> {
  var namecontroller = new TextEditingController();
  var childcontroller = new TextEditingController();
  var addresscontroller = new TextEditingController();
  var adultcontroller = new TextEditingController();

  var name;
  var address;
  var status;

  // final databaseRef = FirebaseDatabase.instance;

  late DatabaseReference databaseReference;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    databaseReference = FirebaseDatabase.instance.ref().child('ticket');
    studentdata();
  }

  void studentdata() async {
    DataSnapshot snapshot =
        (await databaseReference.child(widget.studentkey).get());
    Map student = snapshot.value as Map;

    // namecontroller.text = student['name'];
    // addresscontroller.text = student['address'];
    // adultcontroller.text = student['adult'];
    // childcontroller.text = student['child'];
    name = "madhuri";
    address = student['address'];
    status = student['status'];
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
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 130,
            ),
            Text(widget.studentkey),

            // Text(
            //   "Name: " + name,
            //   style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.w800,
            //       color: Colors.white),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   "Address: " + address,
            //   style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.w800,
            //       color: Colors.white),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Text(
            //   "Staus: " + status,
            //   style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.w800,
            //       color: Colors.white),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),

            // const SizedBox(
            //   height: 15,
            // ),
            MaterialButton(
              onPressed: () {
                Map<String, String> students = {
                  // 'name': namecontroller.text.toString(),
                  // 'address': addresscontroller.text.toString(),
                  // 'adult': adultcontroller.text.toString(),
                  // 'child': childcontroller.text.toString(),
                  'status': "approved"
                };

                databaseReference
                    .child(widget.studentkey)
                    .update(students)
                    .then((value) => Navigator.pop(context));
              },
              child: Text(
                "Approved By Admin",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            )
          ],
        ),
      )),
    ));
  }
}
