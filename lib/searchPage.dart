import 'package:flutter/material.dart';
import 'checkinPage.dart';
import 'bottomNavigationBar.dart';
import 'detailHotel.dart';
import 'itemHotel.dart';
import 'navigationToolBar.dart';
import 'dart:async';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var data = List<HotelObject>();
  var prices = List<PriceObject>();
  StreamController stream = StreamController<bool>.broadcast();
  HotelObject hotelObject = HotelObject(
    image: 'images/image/pic01.jpg',
    distance: 6.3,
    feeling: 'Good',
    name: 'Lemon Tree',
    numReview: 5,
    numStar: 4,
    price: 5000,
    description: 'We have used the AppBar in our code above, '
        'just a simple one. It will show an app bar with a title. '
        'It is easy to use. It usually uses with the appBar parameter '
        'of the Scaffold . But in this tutorial, I will try to use it '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. '
        'as a common widget to describe its parameter. ',
    wifi: true,
    spa: false,
    beach: true,
    restaurant: true,
    pool: true,
    bar: false,
    gym: false,
    ac: true,
    parking: true,
  );
  HotelObject hotelObject2 = HotelObject(
      image: 'images/image/pic02.jpg',
      distance: 8.8,
      feeling: 'Good',
      name: 'Waterfall',
      numReview: 789,
      numStar: 4,
      price: 8000,
      description: 'Interestingly enough I tried with a switch case statement '
          'and it gives me the same warning and thus I cannot run the code. '
          'Am I doing something wrong or is it so that one cannot use if/else or '
          'switch statements without flutter thinking there is dead code?',
      wifi: true,
      spa: true,
      beach: true,
      restaurant: true,
      pool: true,
      bar: true,
      gym: false,
      ac: true,
      parking: true
  );
  HotelObject hotelObject3 = HotelObject(
      image: 'images/image/pic03.jpg',
      distance: 8.3,
      feeling: 'Good',
      name: 'Beach',
      numReview: 5,
      numStar: 4.5,
      price: 5000,
      description: 'In Dart, if/else and switch are statements not expressions. '
          'They don return a value so you can pass them to constructor params. '
          'If you have a lot of conditional logic in your build method, '
          'then it is a good practice to try and simplify it. For example, '
          'you can move self-contained logic to methods, and use '
          'if/else statements to initialize local variables which you can later use.',
      wifi: true,
      spa: false,
      beach: false,
      restaurant: true,
      pool: false,
      bar: true,
      gym: true,
      ac: true,
      parking: true
  );
  HotelObject hotelObject4 = HotelObject(
      image: 'images/image/pic04.jpg',
      distance: 8.3,
      feeling: 'Good',
      name: 'City',
      numReview: 5,
      numStar: 4,
      price: 5000,
      description: 'Streams are similar to observables in Rx, '
          'LiveData in Android. Stream as the name suggest is a sequence of '
          'asynchronous events. You define stream at one place, add data to it '
          'at some other place and then listen to this data addition elsewhere, '
          'so as to refresh your UI etc (like some widget or).',
      wifi: true,
      spa: false,
      beach: true,
      restaurant: false,
      pool: true,
      bar: true,
      gym: false,
      ac: true,
      parking: true
  );
  HotelObject hotelObject5 = HotelObject(
      image: 'images/image/pic05.jpg',
      distance: 8.3,
      feeling: 'Good',
      name: 'Rock',
      numReview: 5,
      numStar: 4,
      price: 5000,
      description: 'You should always close a stream when its task is completed. '
          'Otherwise performance issue may arise when an app becomes a complex '
          'app or when there are many active streams.',
      wifi: true,
      spa: false,
      beach: true,
      restaurant: false,
      pool: true,
      bar: true,
      gym: true,
      ac: true,
      parking: false
  );

  PriceObject priceOnWeb = PriceObject(
      Text(
        'Zenhotels.com',
        style: TextStyle(color: Colors.deepPurple, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Text(
        '125.0',
        style: TextStyle(color: Colors.deepPurple, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Text(
        'as a common widget to describe its parameter. '
            'as a common widget to describe its parameter. ',
        style: TextStyle(color: Colors.deepPurple),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      Text(
        'khdkfg',
      )
  );


  @override
  Widget build(BuildContext context) {
    data.clear();
    data.add(hotelObject);
    data.add(hotelObject2);
    data.add(hotelObject3);
    data.add(hotelObject4);
    data.add(hotelObject5);
    prices.clear();
    prices.add(priceOnWeb);
    for(var a in data)
    {
      a.priceOnWebsite = prices;
    }
    var width = MediaQuery.of(context).size.width;
    var activeBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.white));
    return Scaffold(
//      backgroundColor: Colors.black,
      appBar: PreferredSize(
          child: customNavigationToolBar(),
          preferredSize: Size(MediaQuery.of(context).size.width, 60.0)),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (c, i) {
            return GestureDetector(
              child: ItemHotel(data[i]),
              onTap: () {
                Navigator.push(
                    context,
//                    MaterialPageRoute(builder: (context) => CheckinPage(data[i],stream)));
                    MaterialPageRoute(
                        builder: (context) => DetailHotel(data[i],)));
                print('123');
              },
            );
          }),
      bottomNavigationBar: customBottomNavigationBar(context),
    );
  }
}

class HotelObject {

  HotelObject(
      {this.numStar,
      this.name,
      this.image,
      this.distance,
      this.feeling,
      this.numReview,
      this.price,
      this.description,
      this.wifi,
      this.spa,
      this.beach,
      this.restaurant,
      this.pool,
      this.bar,
      this.gym,
      this.ac,
      this.parking,
      this.priceOnWebsite});

  String image;
  double numStar;
  double distance;
  double price;
  String feeling;
  int numReview;
  String name;
  String description;
  bool wifi;
  bool spa;
  bool beach;
  bool restaurant;
  bool pool;
  bool bar;
  bool gym;
  bool ac;
  bool parking;
  List<PriceObject> priceOnWebsite;
}

class PriceObject {
  PriceObject(
      this.website,
      this.priceOnWeb,
      this.desOnWeb,
      this.detailOnWeb
      );
  Text website;
  Text priceOnWeb;
  Text desOnWeb;
  Text detailOnWeb;
}


