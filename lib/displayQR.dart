import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DisplayQR extends StatefulWidget {
  String message = "";
  DisplayQR(String tempMessage) {
    message = tempMessage;
  }
  @override
  _DisplayQRState createState() => _DisplayQRState(message);
}

class _DisplayQRState extends State<DisplayQR> {
  String message = "";
  _DisplayQRState(String tempMessage) {
    message = tempMessage;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
            child: QrImage(
          size: 1500.0,
          data: message,
        )));
  }
}
