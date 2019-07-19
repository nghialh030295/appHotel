import 'dart:async';

import 'package:flutter/material.dart';
import 'checkinPage.dart';
import 'roomType.dart';

Widget customBottomNavigationBar(BuildContext context,[StreamController streamController]) {
  bool isClicked = false;

  Color iconcolor = Colors.deepPurple;
  return Container(
    color: Colors.black
    ,
    width: MediaQuery.of(context).size.width,
    child: BottomNavigationBar(
      selectedFontSize: 12,
      currentIndex: 0, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: IconButton(icon : Icon(Icons.exit_to_app),
              onPressed:() {
                if(streamController==null)return;
                print(isClicked);
                if(!isClicked)
                {
                  isClicked=!isClicked;
                  streamController.add(true);
                }
                else{
                  isClicked=!isClicked;
                  streamController.add(false);
                }

                print('123');},
              color: iconcolor),
          title: Text('Check-in',
              style: TextStyle(color: Colors.black)),
        ),
        BottomNavigationBarItem(
          icon: IconButton(icon : Icon(Icons.call_missed_outgoing),
              onPressed:() {
            if(streamController==null)return;
            print(isClicked);
            if(!isClicked)
            {
              isClicked=!isClicked;
              streamController.add(true);
            }
            else{
              isClicked=!isClicked;
              streamController.add(false);
            }

                print('123');},
              color: iconcolor),
          title: Text(
            'Check-out',
            style: TextStyle(color: Colors.black),
          ),
        ),
        BottomNavigationBarItem(
            icon: IconButton(icon : Icon(Icons.room_service),
                onPressed:() {PersistentBottomSheetDemo();
                  print('123');},
                color: iconcolor),
            title: Text(
              'Room Type',
              style: TextStyle(color: Colors.black),
            ))
      ],
    ),
  );
}