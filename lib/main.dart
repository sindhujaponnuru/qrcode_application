import 'package:flutter/material.dart';
import 'package:qrcode_app/displayQR.dart';
import 'package:qrcode_app/GenerateQR.dart';
import 'package:qrcode_app/scanQR.dart';
import 'package:crypto/crypto.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Container(
            child: Center(
          child: Column(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text("Generate QR"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GenerateQR()),
                    );
                  },
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("Read QR"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ScanScreen()),
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
