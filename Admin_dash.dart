import 'package:flutter/material.dart';
import 'package:garden_app/screens/Adddetails.dart';
import 'package:garden_app/screens/Addparkscreen.dart';
import 'package:garden_app/screens/Generate_Qrcode.dart';
import 'package:garden_app/screens/Showfeedback.dart';
import 'package:garden_app/screens/Showuserscreen.dart';
import 'package:garden_app/screens/Upload_Data.dart';
import 'package:garden_app/screens/home_screen.dart';
import 'package:garden_app/screens/signin_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int myindex = 0;

  List<Widget> widgetlist = const [
    AddDetailsScreen(),
    AddParkScreen(),
    ShowUserScreen(),
    ShowFeedback(),
    SignInScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/garden.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: widgetlist[myindex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orangeAccent,
          onTap: (index) {
            setState(() {
              myindex = index;
            });
          },
          currentIndex: myindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Add Details",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo),
                label: "Generate qrcode",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded),
                label: "Show User",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.feedback_rounded),
                label: "Show Feedback",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock),
                label: "Logout",
                backgroundColor: Colors.blue),
          ]),
    );
  }
}
