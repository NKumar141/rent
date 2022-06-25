//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_all.dart/main.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import "dart:io";
import '../furniture.dart';
import '../electronics.dart';
import '../clothings.dart';

void main() => runApp(MyAccount());

class MyAccount extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      //MyAccount(),
    );
  }
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

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

  //            text controller
  //final _emailController = TextEditingController();
  //final _passwordController = TextEdittingController();
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  // void dispose() {
  // _emailController.dispose();
  //  _passwordController.dispose();
  //   super.dispose();
  // }

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
          "SignIN",
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
                  //                              SIGN - IN
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          'Sign-In',
                          style: TextStyle(fontFamily: 'Quicksand', fontSize: 34.0, color: Color(getColorHexFromStr('#FFFFFF')), fontWeight: FontWeight.bold),
                        ),
                      ),
                      //                                 @-MAIL
                      SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60, border: Border.all(color: Colors.white60), borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '@-mail',
                              ),
                            ),
                          ),
                        ),
                      ),
                      //                                  OR TEXT
                      SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 11.0),
                        child: Text(
                          'or',
                          style: TextStyle(fontFamily: 'Quicksand', fontSize: 20.0, color: Color(getColorHexFromStr('#FFFFFF')), fontWeight: FontWeight.bold),
                        ),
                      ),
                      //                       NUMBER
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60, border: Border.all(color: Colors.white60), borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '91+ ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      //                               PASSWORD
                      SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60, border: Border.all(color: Colors.white60), borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 35.0),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'password ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      //                      SIGN IN BUTTON
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: GestureDetector(
                          onTap: signIn,
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.green[900], border: Border.all(color: Colors.white60), borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                'Sign-In',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //                         not a member ? Register Now
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'not a member ?',
                            style: TextStyle(fontFamily: 'Quicksand', fontSize: 11.5, color: Colors.black54, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            ' Register Now ',
                            style: TextStyle(fontFamily: 'Quicksand', fontSize: 11.5, color: Color(getColorHexFromStr('#FFFFFF')), fontWeight: FontWeight.bold),
                          ),
                        ],
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
