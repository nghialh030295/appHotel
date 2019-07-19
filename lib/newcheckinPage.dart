import 'package:flutter/material.dart';
import 'dateWidget.dart';
import 'itemHotel.dart';
import 'searchPage.dart';
import 'bottomNavigationBar.dart';
import 'navigationToolBar.dart';

class newCheckinPage extends StatelessWidget {
  newCheckinPage(this.hotelObject);
  HotelObject hotelObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: customNavigationToolBar(),
          preferredSize: Size(MediaQuery.of(context).size.width, 60.0)),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.height-60,
              width: MediaQuery.of(context).size.width,),
            Positioned(
              top: 0,
              child: Container(
                  child: ItemHotel(this.hotelObject)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: customBottomNavigationBar(context),
    );
  }
}
HotelObject hotelObject;
DateTime picked;
DateTime  selectedDate = DateTime.now();
void settingModalBottomSheet(context){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              right: 0,
              child: DatePickerDialogCustom(
                  initialDate: selectedDate,
                  initialDatePickerMode: DatePickerMode.day,
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2100)
              ),
            )
          ],
        );
      }
  );
}
