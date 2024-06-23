import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ShowFeedback extends StatefulWidget {
  const ShowFeedback({super.key});

  @override
  State<ShowFeedback> createState() => _ShowFeedbackState();
}

class _ShowFeedbackState extends State<ShowFeedback> {
  Query dbRef = FirebaseDatabase.instance.ref().child('feedback');
  DatabaseReference reference =
      FirebaseDatabase.instance.ref().child('feedback');

  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 80,
      color: Color.fromARGB(255, 186, 185, 192),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Place Name :" + student['place'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Feedback: " + student['feedback'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
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
