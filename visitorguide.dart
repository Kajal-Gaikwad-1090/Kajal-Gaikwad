import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VisitorScreen extends StatefulWidget {
  const VisitorScreen({super.key});

  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //AppBar
        body: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Color.fromARGB(255, 202, 202, 202),
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(20.0),

                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'About The Place',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 9, 20, 10),
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'Rajiv Gandhi Zoological Park is divided into three sections: the zoo, a lake, and a snake park. It also has a wildlife research centre, which serves as an animal orphanage, rescue centre and care centre. You can visit all these parts and watch the animals being cared for in a protective environment. \n                          Among the various animals in Rajiv Gandhi Zoological Park & Wildlife Research Centre are leopards, black bucks and elephants. Then, you will find different species of snakes and other reptiles in the snake park.This Pune zoo snake park also has a small library, where you can find more information about snakes.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 5, 8, 5),
                      ), //Textstyle
                    ), //Text
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Time Slots To Visit',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 9, 20, 10),
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      '9:30 am–5 pm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 5, 8, 5),
                      ), //Textstyle
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Rules And Regulation',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 9, 20, 10),
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'Never cross any fence or barrier in the Zoo. Do not try to touch the animals— if an animal has teeth, it can bite; if an animal has claws, it can scratch',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 5, 8, 5),
                      ), //Textstyle
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      'How To Reach? ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 9, 20, 10),
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'Address- Pune- Satara Road, Opp Katraj Dairy, Pune, Maharashtra 411046',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 5, 8, 5),
                      ), //Textstyle
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 9, 20, 10),
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'Contact Number- 020 24367212 \n Email id- rajivgandhizoo@punecorporation.org \n  Address- Pune- Satara Road, Opp Katraj Dairy, Pune, Maharashtra 411046',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 5, 8, 5),
                      ), //Textstyle
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ]),

                  //Column
                ),

                //Padding
              ), //SizedBox
            ),
          ),
          //Card
        ), //Center
      ), //Scaffold
    ); //MaterialApp
  }

  sharedata() {}
}
