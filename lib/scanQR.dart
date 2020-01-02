import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:qrcode_app/DetailsPage.dart';
import 'package:qrcode_app/Dict.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(''),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.blueGrey,
                    onPressed: scan,
                    child: const Text('START CAMERA SCAN')),
              ),
              // Padding(
              //     padding:
              //         EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              //     child: getDetails(barcode)),
            ],
          ),
        ));
  }

  // Container displayDetails(String barcode) {
  //   // List<int> list = barcode.codeUnits;
  //   // String details = "";
  //   // details += ascii.decode(list);
  //   // Digest digest = sha1.convert(barcode.codeUnits);
  //   debugPrint("nkdscanned string is " + barcode);
  //   List<String>
  //   return Container(child: Text(""));
  // }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
      getDetails(barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  void getDetails(String hashCode) {
    List<String> list = details[hashCode];
    debugPrint(list.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsPage(list)),
    );
  }
}
