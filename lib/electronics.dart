import 'package:flutter/material.dart';
import '../aboutus.dart';
import '../furniture.dart';
import '../main.dart';
import '../clothings.dart';
import '../myAccount.dart';

void main() => runApp(Electronics());

class Electronics extends StatelessWidget {
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
                Icons.account_circle_outlined,
                size: 28,
              ),
              title: Text(
                'My Account',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                runApp(MyAccount());
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shopping_basket_outlined,
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
                Icons.add_shopping_cart_outlined,
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
                Icons.dry_cleaning_sharp,
                size: 28,
              ),
              title: Text(
                'Clothings',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                runApp(Clothings());
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(
                Icons.alternate_email_outlined,
                size: 28,
              ),
              title: Text(
                'About Us',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                runApp(Aboutus());
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
          "Electronics",
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
                    height: 250.0,
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
                      Row(
                        children: <Widget>[
                          SizedBox(width: 15.0),
                          Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            width: 50.0,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.0), border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 2.0), image: DecorationImage(image: AssetImage('assets/boy.png'))),
                          ),
                          SizedBox(height: 15.0),
                        ],
                      ),
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
                          'Which Electronics do you want to buy?',
                          style: TextStyle(fontFamily: 'Quicksand', fontSize: 23.0, color: Color(getColorHexFromStr('#FFFFFF')), fontWeight: FontWeight.bold),
                        ),
                      ),
                      // SizedBox(height: 10.0)
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.0),
              Stack(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Material(
                    elevation: 10.0,
                    child: Container(
                      height: 75.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/electronicslogoimg/mobile_logo.jpg'))),
                            ),
                            Text(
                              'Mobile',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/electronicslogoimg/laptop_logo.jpg'))),
                            ),
                            Text(
                              'Laptop',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/electronicslogoimg/Tv_logo.jpg'))),
                            ),
                            Text(
                              'T.V & Lights',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 75.0,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/electronicslogoimg/fan_logo.jpg'))),
                            ),
                            Text(
                              'Fans',
                              style: TextStyle(fontFamily: 'Quicksand'),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              itemCard('Sofa 1', 'assets/furnit.png', true),
              itemCard('Sofa 2', 'assets/furnit.png', true),
              itemCard('Sofa 3', 'assets/furnit.png', true),
              itemCard('Sofa 4', 'assets/furnit.png', true),
            ],
          )
        ],
      ),
    );
  }

  Widget itemCard(String title, String imgPath, bool isFavorite) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Container(
        height: 150.0,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: 140.0,
              height: 150.0,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
            ),
            SizedBox(width: 4.0),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontFamily: 'Quicksand', fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 45.0),
                    Material(
                      elevation: isFavorite ? 0.0 : 2.0,
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: isFavorite ? Colors.grey.withOpacity(0.2) : Colors.white),
                        child: Center(
                          child: isFavorite ? Icon(Icons.favorite_border) : Icon(Icons.favorite, color: Colors.red),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5.0),
                Container(
                  width: 175.0,
                  child: Text(
                    'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontFamily: 'Quicksand', color: Colors.grey, fontSize: 12.0),
                  ),
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 35.0),
                    Container(
                      height: 30.0,
                      width: 50.0,
                      color: Color(getColorHexFromStr('#1D5E05')),
                      child: Center(
                        child: Text(
                          '\???12',
                          style: TextStyle(color: Colors.white, fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 90.0,
                      color: Color(getColorHexFromStr('#6DD348')),
                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(color: Colors.white, fontFamily: 'Quicksand', fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
