import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:qrcode_app/Dict.dart';
import 'package:qrcode_app/displayQR.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter_string_encryption/flutter_string_encryption.dart';

class GenerateQR extends StatefulWidget {
  @override
  _GenerateQRState createState() => _GenerateQRState();
}

class _GenerateQRState extends State<GenerateQR> {
  //HashedData hashedData = new HashedData();
  String serialNumber = "";
  String ownerName = "";
  String modelNumber = "";
  String timeStamp = "";
  String date = "";
  String month = "";
  String year = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Text("Enter details to generate QR Code"),
              ),
              Container(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Serial Number",
                    hintText: "Enter serial number"),
                onChanged: (String serial) {
                  setState(() {
                    serialNumber = serial;
                  });
                },
              ),
              Container(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Owner name",
                    hintText: "Enter owner name"),
                onChanged: (String ownerNameTemp) {
                  setState(() {
                    ownerName = ownerNameTemp;
                  });
                },
              ),
              Container(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Model Number",
                    hintText: "Enter model number"),
                onChanged: (String modelNumberTemp) {
                  setState(() {
                    modelNumber = modelNumberTemp;
                  });
                },
              ),
              Text("Time stamp of purchase"),
              Flexible(
                  child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: <Widget>[
                            Text("Date"),
                            TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (String dateTemp) {
                                date = dateTemp;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: <Widget>[
                            Text("Month"),
                            TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (String monthTemp) {
                                month = monthTemp;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: <Widget>[
                            Text("Year"),
                            TextField(
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                              onChanged: (String yearTemp) {
                                year = yearTemp;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              RaisedButton(
                child: Text("Generate"),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayQR(generateHashCode(
                            generateList(serialNumber, ownerName, modelNumber,
                                date, month, year)))),
                  );
                },
              )
            ],
          ),
        ));
  }

  List<String> generateList(String serialNumber, String ownerName,
      String modelNumber, String date, String month, String year) {
    return [
      serialNumber,
      ownerName,
      modelNumber,
      DateTime(int.parse(year), int.parse(month), int.parse(date)).toString()
    ];
  }

  String generateHashCode(List<String> list) {
    String detailsString = "";
    for (var i = 0; i < list.length; i++) {
      detailsString = detailsString + list[i];
      detailsString = detailsString + "\n";
    }
    // final cryptor = new PlatformStringCryptor();
    // //final String key = await cryptor.generateRandomKey();
    // final password = "ab";
    // final String salt = await cryptor.generateSalt();
    // final String key = await cryptor.generateKeyFromPassword(password, salt);
    var bytes = utf8.encode(detailsString);
    String decodedString = utf8.decode(bytes);
    var digest = sha1.convert(bytes);
    debugPrint("detail string is" + digest.toString());
    debugPrint("decoded string is" + decodedString);
    debugPrint(digest.toString());
    details[digest.toString()] = list;
    //hashedData.addData(list, digest.toString());
    return digest.toString();
  }
}
