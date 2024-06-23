import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:garden_app/reusable_widget/reusable_widget.dart';
import 'package:garden_app/screens/Admin_Signin_Screen.dart';
import 'package:garden_app/screens/Userdash.dart';
import 'package:garden_app/screens/home_screen.dart';
import 'package:garden_app/screens/resert_passord.dart';
import 'package:garden_app/screens/signup_screen.dart';
import 'package:garden_app/utils/color_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  String groupvalue = "User";

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
            child: Column(
              children: <Widget>[
                //logoWidget("assets/images/logo1.png"),
                const SizedBox(
                  height: 30,
                ),
                Text("User Login!",
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                        activeColor: Colors.amberAccent,
                        value: "Admin",
                        groupValue: groupvalue,
                        onChanged: (value) {
                          setState(() {
                            groupvalue = value!;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminSignIn()));
                          });
                        }),
                    Text(
                      "Admin",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Radio(
                        activeColor: Colors.amberAccent,
                        value: "User",
                        groupValue: groupvalue,
                        onChanged: (value) {
                          setState(() {
                            groupvalue = value!;
                          });
                        }),
                    Text(
                      "User",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // color: Color.fromARGB(255, 248, 248, 250),

                        child: IconButton(
                          onPressed: () {
                            try {
                              launchUrlString(
                                  'https://www.facebook.com/139156989437538/');
                            } catch (_) {
                              throw Exception("error");
                            }
                          },
                          icon: Icon(
                            Icons.facebook_rounded,
                            color: Color.fromARGB(255, 253, 252, 252),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            try {
                              launchUrlString(
                                  'https://youtu.be/Ti3k-oMdCzY?si=3_MUi30rjyjLW-xe');
                            } catch (_) {
                              throw Exception("error");
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.youtube,
                            color: const Color.fromARGB(255, 250, 249, 249),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            try {
                              launchUrlString(
                                  'https://www.indianyellowpages.com/pune/katraj-local-business-directory.htm');
                            } catch (_) {
                              throw Exception("error");
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.volcano,
                            color: const Color.fromARGB(255, 250, 249, 249),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            try {
                              launchUrlString('https://www.pmc.gov.in/en/zoo');
                            } catch (_) {
                              throw Exception("error");
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.google,
                            color: Color.fromARGB(255, 236, 235, 235),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // color: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            try {
                              launchUrlString(
                                  'https://www.instagram.com/rajiv_gandhi_zoological_park/');
                            } catch (_) {
                              throw Exception("error");
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: const Color.fromARGB(255, 245, 243, 243),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                firebaseUIButton(context, "Sign Up", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UsrrDashScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign in",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPasswprd())),
      ),
    );
  }

  launchUrl2() async {
    // const url = 'https://flutter.dev';
    // if (await canLaunchUrl(Uri.parse(url))) {
    //   await launchUrl(Uri.parse(url));
    // } else {
    //   throw 'Could not launch $url';
    // }
  }
}
