import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanQrcode extends StatefulWidget {
  const ScanQrcode({super.key});

  @override
  State<ScanQrcode> createState() => _ScanQrcodeState();
}

class _ScanQrcodeState extends State<ScanQrcode> {
  String scanResult = '';

  String scandata = '';

  startscan() async {
    var result;

    try {
      result = await FlutterBarcodeScanner.scanBarcode(
          '#FFFFFF', 'cancle', true, ScanMode.QR);
    } on PlatformException catch (e) {
      result = 'Failed';
      Get.snackbar('Error', e.code);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }

    if (!mounted) return;
    setState(() {
      scanResult = result;
    });
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
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              "assets/images/map.jpeg",
              height: 400,
              width: 400,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                "Scanned Value - $scanResult",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  startscan();
                },
                child: Text(
                  "Scan Qrcode",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
