import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanStudent extends StatefulWidget {
  const ScanStudent({Key? key}) : super(key: key);

  @override
  _ScanStudentState createState() => _ScanStudentState();
}

class _ScanStudentState extends State<ScanStudent> {
  String? _barcode = "";

  scan() async {
    return await FlutterBarcodeScanner.scanBarcode(
        "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _barcode = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scan Student QR Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text("Scan"),
              onPressed: () => scan(),
            ),
          ],
        ),
      ),
    );
  }
}
