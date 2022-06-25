import 'package:flutter/material.dart';
import 'package:rent_all.dart/main.dart';
import '../furniture.dart';
import '../electronics.dart';
import '../clothings.dart';

void main() => runApp(Aboutus());

class Aboutus extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  var _homepagescaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(
                  getColorHexFromStr('#81B622'),
                ),
              ),
              child: Column(children: [
                Text(
                  'Options',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
            ListTile(
              leading: Icon(
                Icons.directions_car,
                size: 28,
              ),
              title: Text(
                'Vehicle',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                runApp(MyApp());
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.chair_outlined,
                size: 28,
              ),
              title: Text(
                'Furniture',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                runApp(Furniture());
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.tv_sharp,
                size: 28,
              ),
              title: Text(
                'Electronics',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                runApp(Electronics());
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.dry_cleaning_sharp,
                size: 28,
              ),
              title: Text(
                'Clothing',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                runApp(Clothings());
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      key: _homepagescaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.black),
        ),
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _homepagescaffoldkey.currentState.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 600.0,
                    width: double.infinity,
                    color: Color(getColorHexFromStr('#047008')),
                  ),
                  Positioned(
                    bottom: 50.0,
                    right: 100.0,
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(200.0), color: Color(getColorHexFromStr('#F3F97D')).withOpacity(0.4)),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    left: 150.0,
                    child: Container(height: 300.0, width: 300.0, decoration: BoxDecoration(borderRadius: BorderRadius.circular(150.0), color: Color(getColorHexFromStr('#F3F97D')).withOpacity(0.5))),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Hello, User',
                          style: TextStyle(fontFamily: 'Quicksand', fontSize: 34.0, color: Color(getColorHexFromStr('#FFFFFF')), fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'This is a demo App for our College Project ...                           '
                          'In this app you can rent things which you need on your day to day life.                                     '
                          'Our Application main moto is to provide great quality of products in an economical rate '
                          'directly at you door steps ',
                          style: TextStyle(fontFamily: 'Quicksand', fontSize: 23.0, color: Color(getColorHexFromStr('#FFFFFF')), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
