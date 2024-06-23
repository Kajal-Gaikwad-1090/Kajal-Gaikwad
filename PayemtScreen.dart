import 'package:flutter/material.dart';
import 'package:garden_app/reusable_widget/reusable_widget.dart';

class Payment_Screen extends StatefulWidget {
  const Payment_Screen({super.key});

  @override
  State<Payment_Screen> createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   hexStringToColor("CB2B93"),
        //   hexStringToColor("9546C4"),
        //   hexStringToColor("5E61F4")
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/garden.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: const Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Color.fromARGB(255, 202, 202, 202),
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage("assets/images/scan.jpeg"),
                        height: 250,
                        width: 200,
                      ),
                      SizedBox(
                        height: 10,
                      ), //SizedBox
                      Text(
                        'Bank Details',
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
                        'Bank Name- State Bank of India \n Branch - Katraj \n Account number :32483003048 \n Name: Rajiv Gandhi Park \n IFSC :SBIN0000333 \n CONTACT : 020-24367712',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 5, 8, 5),
                        ), //Textstyle
                      ), //Text
                      SizedBox(
                        height: 10,
                      ),
                      //Text
                      //Text //SizedBox
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ), //Card
          ),
        ),
      ),
    );
  }
}
