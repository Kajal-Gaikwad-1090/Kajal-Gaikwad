import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            scrollDirection: Axis.vertical,
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 248, 247, 247),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/one.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.yellow,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/two.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/three.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/four.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/five.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/six.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/seven.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/eight.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/nine.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/ten.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
                ),
              ),
              // InkWell(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.grey,
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           "assets/images/tewel.jpg",
              //           height: 150,
              //           width: 150,
              //           fit: BoxFit.fill,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.grey,
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           "assets/images/thirteen.jpg",
              //           height: 150,
              //           width: 150,
              //           fit: BoxFit.fill,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.grey,
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           "assets/images/fourteen.jpg",
              //           height: 150,
              //           width: 150,
              //           fit: BoxFit.fill,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // InkWell(
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.grey,
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Image.asset(
              //           "assets/images/eleven.jpg",
              //           height: 150,
              //           width: 150,
              //           fit: BoxFit.fill,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          ),
        ),
      ),
    );
  }
}
