import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:garden_app/screens/Userinfoscreen.dart';

class ShowGardenScreen extends StatefulWidget {
  const ShowGardenScreen({super.key});

  @override
  State<ShowGardenScreen> createState() => _ShowGardenScreenState();
}

class _ShowGardenScreenState extends State<ShowGardenScreen> {
  Query dbRef = FirebaseDatabase.instance.ref().child('palce');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('palce');

  Widget listItem({required Map student}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 300,
      color: Color.fromARGB(255, 175, 171, 199),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      Image.network(
                        student['imageurl'],
                        // height: 70,
                        width: 50,
                      )
                    ],
                  ),
                ),
                //   Text(
                //     "Name :" + student['place'],
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                //   ),
                //   SizedBox(
                //     height: 10,
                //   ),
                //   Text(
                //     "Description: " + student['desc'],
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                //   ),
                //   Text(
                //     "Address: " + student['address'],
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                //   ),
                //   Text(
                //     "Time: " + student['time'],
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                //   ),
                //   Text(
                //     "Adult Price: " + student['adult'],
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                //   ),
                //   Text(
                //     "Child Price: " + student['child'],
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                //   ),
              ]),
          Text(
            "Name :" + student['place'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Description: " + student['desc'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Address: " + student['address'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Time: " + student['time'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Adult Price: " + student['adult'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Text(
            "Child Price: " + student['child'],
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // print(student['key']);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => UserInfoScreen(
                              adult: student['adult'],
                              child: student['child'])));
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
