import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:garden_app/screens/Adddetails.dart';
import 'package:garden_app/screens/Addparkscreen.dart';
import 'package:garden_app/screens/Admin_dash.dart';
import 'package:garden_app/screens/Gallery.dart';
import 'package:garden_app/screens/Generate_Qrcode.dart';
import 'package:garden_app/screens/PayemtScreen.dart';
import 'package:garden_app/screens/ScanQrcode.dart';
import 'package:garden_app/screens/Showgarden.dart';
import 'package:garden_app/screens/Showuserscreen.dart';
import 'package:garden_app/screens/Upload_Data.dart';
import 'package:garden_app/screens/Userdash.dart';
import 'package:garden_app/screens/Userinfoscreen.dart';

import 'package:garden_app/screens/signin_screen.dart';
import 'package:garden_app/screens/visitorguide.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignInScreen());
  }
}
