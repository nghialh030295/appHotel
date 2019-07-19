import 'package:flutter/material.dart';
import 'searchPage.dart';

class DetailHotel extends StatefulWidget {
  DetailHotel(this.hotelObject);
  HotelObject hotelObject;

  @override
  _DetailHotelState createState() => _DetailHotelState();
}

class _DetailHotelState extends State<DetailHotel> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Colors.indigoAccent,
      Colors.deepPurpleAccent,
      Colors.deepPurple
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  final Shader linearGradient2 = LinearGradient(
    colors: <Color>[
      Colors.grey,
      Colors.grey,
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  Color iconcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    IconMenu freewifi = IconMenu(
        Icon(Icons.wifi,
            color: widget.hotelObject.wifi ? Colors.deepPurple : Colors.grey),
        Text(
          'Free WiFi',
          style: TextStyle(
              color: widget.hotelObject.wifi ? Colors.deepPurple : Colors.grey),
        ));
    IconMenu spa = IconMenu(
        Icon(Icons.spa,
            color: widget.hotelObject.spa ? Colors.deepPurple : Colors.grey),
        Text(
          'Spa',
          style: TextStyle(
              color: widget.hotelObject.spa ? Colors.deepPurple : Colors.grey),
        ));
    IconMenu beach = IconMenu(
        Icon(Icons.beach_access,
            color: widget.hotelObject.beach ? Colors.deepPurple : Colors.grey),
        Text(
          'Free WiFi',
          style: TextStyle(
              color:
                  widget.hotelObject.beach ? Colors.deepPurple : Colors.grey),
        ));
    IconMenu restaurant = IconMenu(
        Icon(Icons.restaurant,
            color: widget.hotelObject.restaurant
                ? Colors.deepPurple
                : Colors.grey),
        Text(
          'Restaurant',
          style: TextStyle(
              color: widget.hotelObject.restaurant
                  ? Colors.deepPurple
                  : Colors.grey),
        ));
    IconMenu pool = IconMenu(
        Icon(Icons.pool,
            color: widget.hotelObject.pool ? Colors.deepPurple : Colors.grey),
        Text(
          'Pool',
          style: TextStyle(
              color: widget.hotelObject.pool ? Colors.deepPurple : Colors.grey),
        ));
    IconMenu bar = IconMenu(
        Icon(Icons.local_bar,
            color: widget.hotelObject.bar ? Colors.deepPurple : Colors.grey),
        Text(
          'Bar',
          style: TextStyle(
              color: widget.hotelObject.bar ? Colors.deepPurple : Colors.grey),
        ));
    IconMenu gym = IconMenu(
        Icon(Icons.fitness_center,
            color: widget.hotelObject.gym ? Colors.deepPurple : Colors.grey),
        Text(
          'Gym',
          style: TextStyle(
              color: widget.hotelObject.gym ? Colors.deepPurple : Colors.grey),
        ));
    IconMenu ac = IconMenu(
        Icon(Icons.ac_unit,
            color: widget.hotelObject.ac ? Colors.deepPurple : Colors.grey),
        Text(
          'A/C',
          style: TextStyle(
              color: widget.hotelObject.ac ? Colors.deepPurple : Colors.grey),
        ));
    IconMenu parking = IconMenu(
        Icon(Icons.local_parking,
            color:
                widget.hotelObject.parking ? Colors.deepPurple : Colors.grey),
        Text(
          'Parking',
          style: TextStyle(
              color:
                  widget.hotelObject.parking ? Colors.deepPurple : Colors.grey),
        ));
    return Scaffold(
        appBar: PreferredSize(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.hotelObject.image),
                        fit: BoxFit.cover),
                  ),
                ),
                AppBar(
                    title: Text(widget.hotelObject.name),
                    backgroundColor: Colors.transparent),
              ],
            ),
            preferredSize: Size(MediaQuery.of(context).size.width, 200.0)),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                      unselectedLabelStyle: TextStyle(
                          foreground: Paint()..shader = linearGradient2,
                          fontSize: 18),
                      labelStyle: TextStyle(
                          foreground: Paint()..shader = linearGradient,
                          fontSize: 18),
                      indicatorColor: Colors.deepPurple,
                      indicatorWeight: 4,
                      tabs: [
                        Tab(text: 'Details'),
                        Tab(text: "Prices"),
                        Tab(text: "Rating"),
                      ]),
                ),
                Expanded(
                    child: TabBarView(children: [
                      Container(
                        child: ListView(
                          children: <Widget>[
                            Card(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(15),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'About ' + widget.hotelObject.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        widget.hotelObject.description,
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.bottomRight,
                                      padding: EdgeInsets.all(15),
                                      child: Text(
                                        'Read more',
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        'AMENITIES',
                                        style: TextStyle(
                                            foreground: Paint()
                                              ..shader = linearGradient,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: <Widget>[
                                          Row(children: <Widget>[
                                            freewifi,
                                            spa,
                                            beach
                                          ]),
                                          Row(children: <Widget>[
                                            restaurant,
                                            pool,
                                            bar
                                          ]),
                                          Row(children: <Widget>[
                                            gym,
                                            ac,
                                            parking
                                          ]),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      ListPrice(widget.hotelObject),
                      /*Container(
                        child: Text("User Body"),
                      ),*/
                      Container(
                        child: Text("User Body"),
                      ),
                    ]),
                )
              ],
            )),
        bottomNavigationBar: Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: [
                Colors.indigoAccent,
                Colors.deepPurpleAccent,
                Colors.deepPurple
              ]),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
          width: MediaQuery.of(context).size.width,
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            selectedFontSize: 12,
            currentIndex: 0, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                    icon: Icon(Icons.language),
                    onPressed: () {
                      print('123');
                    },
                    color: iconcolor),
                title: Text('Website', style: TextStyle(color: iconcolor)),
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      print('123');
                    },
                    color: iconcolor),
                title: Text(
                  'Call us ',
                  style: TextStyle(color: iconcolor),
                ),
              ),
              BottomNavigationBarItem(
                  icon: IconButton(
                      icon: Icon(Icons.location_on),
                      onPressed: () {
                        print('123');
                      },
                      color: iconcolor),
                  title: Text(
                    'Location',
                    style: TextStyle(color: iconcolor),
                  ))
            ],
          ),
        ));
  }
}

class IconMenu extends StatelessWidget {
  IconMenu(this.icon, this.text);
  Icon icon;
  Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 3 -10,
//      color: Colors.green,
      child: Column(
        children: <Widget>[icon, text],
      ),
    );
  }
}
class PricesHotel extends StatelessWidget {
  PricesHotel(this.price);
  PriceObject price;
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.blue,
      child: Container(
        height: 80,
        color: Colors.blue,
        child: Card(
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.green,
                    child: price.website,
                  ),
                  Row(
                    children: <Widget>[
                      price.desOnWeb,
                      Text(' - '),
                      price.detailOnWeb
                    ],
                  ),
                ],
              ),
              price.priceOnWeb
            ],
          ),
        ),
      ),
    );
  }
}
class ListPrice extends StatelessWidget {
  ListPrice(this.hotelObject);
  HotelObject hotelObject;
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: hotelObject.priceOnWebsite.length,
        itemBuilder: (c, i){
        return  PricesHotel(hotelObject.priceOnWebsite[i]);
  });
  }
}




