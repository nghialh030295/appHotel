import 'dart:async';

import 'package:flutter/material.dart';
import 'dateWidget.dart';
import 'itemHotel.dart';
import 'searchPage.dart';
import 'bottomNavigationBar.dart';
import 'navigationToolBar.dart';

class CheckinPage extends StatefulWidget {
  CheckinPage(this.hotelObject,this.stream);
  StreamController<bool> stream;
  HotelObject hotelObject;

  @override
  _CheckinPageState createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> {
  DateTime picked;
  DateTime selectedDate = DateTime.now();
  bool isShow=false;
  @override
  void initState() {
    super.initState();
    widget.stream.stream.listen((b){
      setState(() {
        this.isShow=b;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var myHeight = double.maxFinite;
    selectedDate = DateTime.now();
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: customNavigationToolBar(),
          preferredSize: Size(MediaQuery.of(context).size.width, 60.0)),
      body: Container(
//        color: Colors.black,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 60,
              width: MediaQuery.of(context).size.width,
            ),
            Positioned(
              child: Container(child: ItemHotel(this.widget.hotelObject)),
            ),
            Positioned(
              bottom:0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.blue,
                child: isShow?datePicker():Container()
              )
            ),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(context,widget.stream),
    );
  }
}
DateTime picked;
DateTime selectedDate = DateTime.now();
Widget datePicker(){
  return Container(
    color: Colors.black,
    child: DatePickerDialogCustom(
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2018),
        lastDate: DateTime(2100)),
  );
}
