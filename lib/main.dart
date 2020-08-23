import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Qrcode(),
    ));

// ignore: camel_case_types
class Qrcode extends StatefulWidget {
  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  String _data = "";

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "cancel", true, ScanMode.BARCODE)
        .then(
      (value) => setState(() => _data = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Title(
            color: Colors.teal.shade100,
            child: Text(
              'BarCode Scanner',
              style: TextStyle(fontStyle: FontStyle.italic),
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              child: Text("Scan barcode", style: TextStyle(fontSize: 30)),
              onPressed: () => _scan(),
            ),
            Text(_data)
          ],
        ),
      ),
    );
  }
}
