import 'package:flutter/material.dart';
import 'package:garden_app/screens/Gallery.dart';
import 'package:garden_app/screens/Generate_Qrcode.dart';
import 'package:garden_app/screens/PayemtScreen.dart';
import 'package:garden_app/screens/ScanQrcode.dart';
import 'package:garden_app/screens/Showgarden.dart';
import 'package:garden_app/screens/UploadFeedback.dart';
import 'package:garden_app/screens/home_screen.dart';
import 'package:garden_app/screens/signin_screen.dart';
import 'package:garden_app/screens/visitorguide.dart';

class UsrrDashScreen extends StatefulWidget {
  const UsrrDashScreen({super.key});

  @override
  State<UsrrDashScreen> createState() => _UsrrDashScreenState();
}

class _UsrrDashScreenState extends State<UsrrDashScreen> {
  int myindex = 0;

  List<Widget> widgetlist = const [
    ShowGardenScreen(),
    Payment_Screen(),
    ScanQrcode(),
    VisitorScreen(),
    GalleryScreen(),
    UploadFeedback(),
    SignInScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Dashboard"),
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
                icon: Icon(Icons.grade_rounded),
                label: "Book Ticket",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: "Payment",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: "Visitor Guide",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.star_border_outlined),
                label: "Other",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_album),
                label: "Gallery",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.feedback_rounded),
                label: "Feedback",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock),
                label: "Logout",
                backgroundColor: Colors.blue),
          ]),
    );
  }
}
