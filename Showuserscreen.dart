import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:garden_app/screens/UpdateRecods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowUserScreen extends StatefulWidget {
  const ShowUserScreen({super.key});

  @override
  State<ShowUserScreen> createState() => _ShowUserScreenState();
}

class _ShowUserScreenState extends State<ShowUserScreen> {
  Query dbRef = FirebaseDatabase.instance.ref().child('ticket');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('ticket');

  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 150,
      color: Color.fromARGB(255, 121, 120, 126),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name :" + student['name'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Address: " + student['address'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Child: " + student['child'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Adult: " + student['adult'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              UpdateRecodeScreen(studentkey: student['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.book_online,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   width: 6,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     reference.child(student['key']).remove();
              //   },
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.delete,
              //         color: Colors.red[700],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          )
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
        query: dbRef,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map student = snapshot.value as Map;
          student['key'] = snapshot.key;

          return listItem(student: student);
        },
      ),
    ));
  }
}

Future<void> Share_data(String s) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  pref.setString('email', s);
}
