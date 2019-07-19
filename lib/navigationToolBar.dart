import 'package:flutter/material.dart';

class customNavigationToolBar extends StatefulWidget {
  @override
  _customNavigationToolBarState createState() =>
      _customNavigationToolBarState();
}

class _customNavigationToolBarState extends State<customNavigationToolBar> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var activeBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.white));
    return Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.indigoAccent,
            Colors.deepPurpleAccent,
            Colors.deepPurple
          ]),
        ),
        child: NavigationToolbar(
            leading: Container(
              width: 40,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.filter_list, color: Colors.white),
            ),
            middle: Container(
//             color: Colors.green,
              width: width - 140,
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 10),
                    enabledBorder: activeBorder,
                    focusedBorder: activeBorder,
                    border: activeBorder,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
//                  color: Colors.blue,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.white),
                  Icon(Icons.person, color: Colors.white),
                ],
              ),
            ),
          centerMiddle: true,
          middleSpacing: 2.0,
        )
    );
  }
}
