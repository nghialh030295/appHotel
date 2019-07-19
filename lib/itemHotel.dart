import 'package:booking_hotel/searchPage.dart';
import 'package:flutter/material.dart';

class ItemHotel extends StatelessWidget {
  ItemHotel(this.hotelObject);
  HotelObject hotelObject;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
//        color: Colors.blue,
//        padding: EdgeInsets.all(4),
          height: 270,
          child: Column(
            children: <Widget>[
              Expanded(child: ListHotel(context, hotelObject)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: infoHotel(hotelObject),
                height: 90,
              ),
            ],
          ),
        ));
  }
}

Widget ListHotel(context, HotelObject hotel) {
  var width = MediaQuery.of(context).size.width;

  return Container(
    decoration: ShapeDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            image: AssetImage(hotel.image), fit: BoxFit.fill),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)))),
    width: width,
  );
}

Widget infoHotel(HotelObject hotel) {
  var stars = List<Widget>();
  for (var i = 0; i < hotel.numStar; i++) {
    stars.add(Icon(Icons.star, size: 16, color: Colors.deepPurple));
  }
  if (stars.length < 5) {
    for (var i = 0; i < 5 - hotel.numStar; i++) {
      stars.add(Icon(Icons.star, size: 16, color: Colors.grey));
    }
  }
  return Container(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              hotel.name,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: stars,
            )
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: Colors.grey[600],
                ),
                Text(
                  '${hotel.distance} km from centre',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Text(
              '${hotel.numReview} reviews',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '\$${hotel.price}',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              hotel.feeling,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            )
          ],
        )
      ],
    ),
  );
}