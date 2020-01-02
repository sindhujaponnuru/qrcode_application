import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  List<String> detailsList;
  DetailsPage(List<String> list) {
    detailsList = list;
  }
  @override
  _DetailsPageState createState() => _DetailsPageState(detailsList);
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> _list;
  _DetailsPageState(List<String> list) {
    _list = list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Your details")),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[Text(" Serial Number : "), Text(_list[0])],
              ),
              Row(
                children: <Widget>[Text(" Owner Name : "), Text(_list[1])],
              ),
              Row(
                children: <Widget>[Text(" Model Number : "), Text(_list[2])],
              ),
              Row(
                children: <Widget>[Text(" Time Stamp : "), Text(_list[3])],
              )
            ],
          )),
    );
  }
}
