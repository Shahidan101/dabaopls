// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:milestone_progress/milestone_progress.dart';

void main() => runApp(MyApp());

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

MaterialColor colorCustom = MaterialColor(0xfff83800, color);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    MyHomePageStateTwo(),
                transitionDuration: Duration(seconds: 0),
              ),
            ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 115),
              child: SizedBox(
                height: 155.0,
                child: Image.asset(
                  "images/logo_white.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 70),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePageStateTwo extends StatefulWidget {
  @override
  _MyHomePageStateTwo createState() => _MyHomePageStateTwo();
}

class _MyHomePageStateTwo extends State<MyHomePageStateTwo> {
  TextStyle style = TextStyle(
    fontFamily: 'San Francisco Pro',
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.0,
            )),
      ),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
          borderSide: BorderSide(
            color: Colors.white,
            width: 0.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide(
              color: Colors.white,
              width: 0.0,
            )),
      ),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) => MyGoingIn(),
              transitionDuration: Duration(seconds: 0),
            ),
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style:
                style.copyWith(color: Colors.red, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "images/logo_white.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyGoingIn extends StatefulWidget {
  @override
  GoingIn createState() => GoingIn();
}

class GoingIn extends State<MyGoingIn> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SelectCafePage()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 115),
              child: SizedBox(
                height: 155.0,
                child: Image.asset(
                  "images/logo_white.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 70),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectCafePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyCheckOutPage()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            )
          ],
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
                child: Text("Village 2 Island One Cafe",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
                child: Text("Village 2 Gee & S",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
                child: Text("Village 3 Mailisya",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
                child: Text("Village 5 Afifah Beta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            /*Village 2 Island One Cafe TabView*/
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 15),
              scrollDirection: Axis.vertical,
              children: [
                /*Cafe Details*/
                Container(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*Cafe Name*/
                                    Container(
                                      // width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        "Village 2 Island One Cafe",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        // width: MediaQuery.of(context).size.width,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              /*Star Rating*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    bottom: 10),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 18,
                                                ),
                                              ),
                                              /*Rating Value*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "4.6",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              /*A border line*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "|",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              /*See Details*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "See Details",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                /*Today's Favourites*/
                /*Title*/
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Today's Favourites",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                /* Favourites Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*First Favourite Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/friedbeehoon.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Fried Bee Hoon",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "3.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderPageFriedBeeHoon()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*Second Favourite Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/sweetsourchickenrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Sweet & Sour Chicken Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "6.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Menu Title*/
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Other Items",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                /*First & Second Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*First Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/friedrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Fried Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "3.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*Second Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/friedkueyteow.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Fried Kuey Teow",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "3.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*3rd and 4th Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*3rd Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/spaghetti.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Spaghetti",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "5.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*4th Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/thaifriedrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Thai Fried Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "4.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*5th and 6th Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*5th Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/bbqchickenrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "BBQ Chicken Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "6.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*6th Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/butterchickenrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Butter Chicken Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "6.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*Village 2 Gee & S TabView*/
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 15),
              scrollDirection: Axis.vertical,
              children: [
                /*Cafe Details*/
                Container(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*Cafe Name*/
                                    Container(
                                      // width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        "Village 2 Gee & S",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        // width: MediaQuery.of(context).size.width,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              /*Star Rating*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    bottom: 10),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 18,
                                                ),
                                              ),
                                              /*Rating Value*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "4.5",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              /*A border line*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "|",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              /*See Details*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "See Details",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                /*Today's Favourites*/
                /*Title*/
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Today's Favourites",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                /* Favourites Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*First Favourite Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/tomyamayam.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Tom Yam Ayam",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "5.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderPageTomYamAyam()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Menu Title*/
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Other Items",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                /*First & Second Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*First Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/nasigorengkampung.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Nasi Goreng Kampung",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "2.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*Second Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/nasigorengtomyam.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Nasi Goreng Tomyam",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "3.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*3rd and 4th Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*3rd Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/meerebus.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Mee Rebus",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "4.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*4th Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/charkueyteow.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Char Kuey Teow",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "4.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*Third Cafe Menu*/
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 15),
              scrollDirection: Axis.vertical,
              children: [
                /*Cafe Details*/
                Container(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*Cafe Name*/
                                    Container(
                                      // width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        "Village 3 Mailisya",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        // width: MediaQuery.of(context).size.width,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              /*Star Rating*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    bottom: 10),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 18,
                                                ),
                                              ),
                                              /*Rating Value*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "4.7",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              /*A border line*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "|",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              /*See Details*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "See Details",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/closed.png",
                            height: 300,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text("Sorry, we're closed today",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: 'San Francisco UI')),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            /*Fourth Cafe Menu*/
            ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/comingsoon.png",
                        height: 300,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text("Coming soon to your campus!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'San Francisco UI')),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class SelectCafePageTwo extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyCheckOutPageTwo()));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
            )
          ],
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
                child: Text("Village 2 Island One Cafe",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
                child: Text("Village 2 Gee & S",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
                child: Text("Village 3 Mailisya",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
                child: Text("Village 5 Afifah Beta",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            /*Village 2 Island One Cafe TabView*/
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 15),
              scrollDirection: Axis.vertical,
              children: [
                /*Cafe Details*/
                Container(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*Cafe Name*/
                                    Container(
                                      // width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        "Village 2 Island One Cafe",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        // width: MediaQuery.of(context).size.width,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              /*Star Rating*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    bottom: 10),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 18,
                                                ),
                                              ),
                                              /*Rating Value*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "4.6",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              /*A border line*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "|",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              /*See Details*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "See Details",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                /*Today's Favourites*/
                /*Title*/
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Today's Favourites",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                /* Favourites Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*First Favourite Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/friedbeehoon.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Fried Bee Hoon",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "3.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderPageFriedBeeHoon()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*Second Favourite Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/sweetsourchickenrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Sweet & Sour Chicken Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "6.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Menu Title*/
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Other Items",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                /*First & Second Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*First Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/friedrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Fried Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "3.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*Second Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/friedkueyteow.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Fried Kuey Teow",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "3.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*3rd and 4th Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*3rd Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/spaghetti.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Spaghetti",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "5.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*4th Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/thaifriedrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Thai Fried Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "4.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*5th and 6th Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*5th Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/bbqchickenrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "BBQ Chicken Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "6.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*6th Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/butterchickenrice.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Butter Chicken Rice",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "6.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*Village 2 Gee & S TabView*/
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 15),
              scrollDirection: Axis.vertical,
              children: [
                /*Cafe Details*/
                Container(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*Cafe Name*/
                                    Container(
                                      // width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        "Village 2 Gee & S",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        // width: MediaQuery.of(context).size.width,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              /*Star Rating*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    bottom: 10),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 18,
                                                ),
                                              ),
                                              /*Rating Value*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "4.5",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              /*A border line*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "|",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              /*See Details*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "See Details",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                /*Today's Favourites*/
                /*Title*/
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Today's Favourites",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                /* Favourites Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*First Favourite Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/tomyamayam.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Tom Yam Ayam",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "5.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OrderPageTomYamAyam()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Menu Title*/
                Container(
                    padding: EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      "Other Items",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),
                /*First & Second Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*First Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/nasigorengkampung.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Nasi Goreng Kampung",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "2.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*Second Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/nasigorengtomyam.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Nasi Goreng Tomyam",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "3.50",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*3rd and 4th Menu Item Row*/
                Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*3rd Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(left: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/meerebus.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Mee Rebus",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "4.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                      /*4th Menu Item*/
                      Container(
                        width: (MediaQuery.of(context).size.width / 2),
                        padding: EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          child: Container(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /*Photo of Food*/
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    'images/charkueyteow.jpg',
                                  ),
                                ),
                                /*Name of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Char Kuey Teow",
                                      style: TextStyle(color: Colors.black),
                                    )),
                                /*Price of Food*/
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      "4.00",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ))
                              ],
                            ),
                          ),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            /*Third Cafe Menu*/
            ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 15),
              scrollDirection: Axis.vertical,
              children: [
                /*Cafe Details*/
                Container(
                  padding: EdgeInsets.all(15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          child: Row(
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*Cafe Name*/
                                    Container(
                                      // width: MediaQuery.of(context).size.width,
                                      padding:
                                          EdgeInsets.only(top: 5, left: 10),
                                      child: Text(
                                        "Village 3 Mailisya",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        // width: MediaQuery.of(context).size.width,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              /*Star Rating*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    left: 10,
                                                    bottom: 10),
                                                child: Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 18,
                                                ),
                                              ),
                                              /*Rating Value*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "4.7",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              /*A border line*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "|",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ),
                                              /*See Details*/
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 5,
                                                    bottom: 10),
                                                child: Text(
                                                  "See Details",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18,
                                                      decoration: TextDecoration
                                                          .underline),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/closed.png",
                            height: 300,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 15),
                            child: Text("Sorry, we're closed today",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    fontFamily: 'San Francisco UI')),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            /*Fourth Cafe Menu*/
            ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/comingsoon.png",
                        height: 300,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Text("Coming soon to your campus!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                fontFamily: 'San Francisco UI')),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OrderPageFriedBeeHoon extends StatelessWidget {
  int _itemCountOne = 1;
  int _addOnOneCountItemOne = 0;
  int _addOnTwoCountItemOne = 0;
  int _addOnThreeCountItemOne = 0;
  double _itemPriceOne = 3.50;
  double _addOnOnePriceOne = 3.00;
  double _addOnTwoPriceOne = 4.00;
  double _addOnThreePriceOne = 1.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: ListView(
        children: [
          // Image of Fried Bee Hoon
          Container(
            child: AspectRatio(
              aspectRatio: 300 / 150,
              child: new Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.topCenter,
                          image: AssetImage("images/friedbeehoon.jpg")))),
            ),
          ),
          // Food Name and Price
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Column(
                        children: [
                          Text(
                            "Fried Bee Hoon",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'San Francisco Pro',
                            ),
                          ),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(right: 15, top: 15),
                    child: Text(
                      _itemPriceOne.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'San Francisco Pro',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Count of items ordered
          Container(
              padding: EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 25),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(right: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12)),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      if (_itemCountOne > 1) {
                                        _itemCountOne--;
                                      }
                                      (context as Element).markNeedsBuild();
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                      size: 40,
                                    )),
                              )),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.transparent),
                            child: Text(
                              _itemCountOne.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12)),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      _itemCountOne++;
                                      (context as Element).markNeedsBuild();
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.red,
                                      size: 40,
                                    )),
                              ))
                        ],
                      ),
                    ),
                  ),
                  /*Today's Favourites*/
                  /*Title*/
                ],
              )),
          // Add a Divider
          Container(
              padding: EdgeInsets.symmetric(vertical: 15), child: Divider()),
          // Add Ons Title
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, top: 5, bottom: 15),
              child: Text(
                "Add On",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          // First Add On Item
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15, top: 5, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fried Chicken",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      _addOnOnePriceOne.toStringAsFixed(2),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 30, right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    if (_addOnOneCountItemOne > 0) {
                                      _addOnOneCountItemOne--;
                                    }
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                    size: 24,
                                  )),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.transparent),
                          child: Text(
                            _addOnOneCountItemOne.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    _addOnOneCountItemOne++;
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.red,
                                    size: 24,
                                  )),
                            ))
                      ],
                    ))
              ],
            ),
          ),
          // Second Add On Item
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15, top: 5, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fried Boneless Chicken",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      _addOnTwoPriceOne.toStringAsFixed(2),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 30, right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    if (_addOnTwoCountItemOne > 0) {
                                      _addOnTwoCountItemOne--;
                                    }
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                    size: 24,
                                  )),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.transparent),
                          child: Text(
                            _addOnTwoCountItemOne.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    _addOnTwoCountItemOne++;
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.red,
                                    size: 24,
                                  )),
                            ))
                      ],
                    ))
              ],
            ),
          ),
          // Third Add On Item
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15, top: 5, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Omelette",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      _addOnThreePriceOne.toStringAsFixed(2),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
                Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 30, right: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    if (_addOnThreeCountItemOne > 0) {
                                      _addOnThreeCountItemOne--;
                                    }
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.red,
                                    size: 24,
                                  )),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          padding:
                              EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.transparent),
                          child: Text(
                            _addOnThreeCountItemOne.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12)),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  onTap: () {
                                    _addOnThreeCountItemOne++;
                                    (context as Element).markNeedsBuild();
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.red,
                                    size: 24,
                                  )),
                            ))
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Colors.transparent,
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: MaterialButton(
                        minWidth: 300,
                        height: 65,
                        onPressed: () {
                          final snackBar = SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text('Item Added to Cart'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Add to Basket",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  ((_itemPriceOne * _itemCountOne) +
                                          (_addOnOneCountItemOne *
                                              _addOnOnePriceOne *
                                              _itemCountOne) +
                                          (_addOnTwoCountItemOne *
                                              _addOnTwoPriceOne *
                                              _itemCountOne) +
                                          (_addOnThreeCountItemOne *
                                              _addOnThreePriceOne *
                                              _itemCountOne))
                                      .toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}

// ignore: must_be_immutable
class OrderPageTomYamAyam extends StatelessWidget {
  int _itemCountTwo = 1;
  double _itemPriceTwo = 5.00;
  // ignore: unused_field
  double _itemTwoTotal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Item"),
      ),
      body: ListView(
        children: [
          // Image of Fried Bee Hoon
          Container(
            child: AspectRatio(
              aspectRatio: 300 / 150,
              child: new Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.topCenter,
                          image: AssetImage("images/tomyamayam.jpg")))),
            ),
          ),
          // Food Name and Price
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 15, top: 15),
                      child: Column(
                        children: [
                          Text(
                            "Tom Yam Ayam",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'San Francisco Pro',
                            ),
                          ),
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.only(right: 15, top: 15),
                    child: Text(
                      _itemPriceTwo.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'San Francisco Pro',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Count of items ordered
          Container(
              padding: EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 25),
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent),
                      child: Row(
                        children: [
                          Container(
                              padding: EdgeInsets.only(right: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12)),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      if (_itemCountTwo > 1) {
                                        _itemCountTwo--;
                                      }
                                      (context as Element).markNeedsBuild();
                                    },
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.red,
                                      size: 40,
                                    )),
                              )),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 3, vertical: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.transparent),
                            child: Text(
                              _itemCountTwo.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(left: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(12)),
                                child: InkWell(
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: () {
                                      _itemCountTwo++;
                                      (context as Element).markNeedsBuild();
                                    },
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.red,
                                      size: 40,
                                    )),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Colors.transparent,
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: MaterialButton(
                        minWidth: 300,
                        height: 65,
                        onPressed: () {
                          final snackBar = SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text('Item Added to Cart'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Add to Basket",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  ((_itemTwoTotal =
                                          _itemCountTwo * _itemPriceTwo))
                                      .toStringAsFixed(2),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}

class MyCheckOutPage extends StatefulWidget {
  @override
  CheckOutPage createState() => CheckOutPage();
}

// ignore: must_be_immutable
class CheckOutPage extends State<MyCheckOutPage> {
  int _radioValue1 = 0;

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: Text("Checkout"),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectCafePageTwo()),
                );
              },
            ),
          ),
          body: ListView(
            children: [
              // Order Summary
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'San Francisco Pro',
                            color: Colors.grey),
                      ),
                    ],
                  )),
              // Fried Bee Hoon Order
              Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      // Fried Bee Hoon Order
                      Container(
                          padding: EdgeInsets.only(
                              left: 15, right: 20, top: 15, bottom: 15),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Image of Fried Bee Hoon and Name
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      child: Text('x',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 2, right: 5),
                                      child: Text('1',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Text(
                                                'Fried Bee Hoon',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily:
                                                      'San Francisco Pro',
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child:
                                                  Text('Add On: Omelette  x 1',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'San Francisco UI',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      )),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              // Count of Fried Bee Hoon
                              Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      '4.50',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'San Francisco Pro',
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ))
                      // Add On: Omelette
                    ],
                  )),
              // Add a Divider
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              // Subtotal and Total and all
              Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Column of titles
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1),
                            child: Text("Subtotal",
                                style: TextStyle(
                                  fontFamily: 'San Francisco UI',
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1),
                            child: Text("Service fee",
                                style: TextStyle(
                                  fontFamily: 'San Francisco UI',
                                )),
                          )
                        ],
                      )),
                      // Column of prices
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1),
                            child: Text("4.50",
                                style: TextStyle(
                                  fontFamily: 'San Francisco UI',
                                )),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1),
                            child: Text("1.00",
                                style: TextStyle(
                                  fontFamily: 'San Francisco UI',
                                )),
                          )
                        ],
                      )),
                    ],
                  )),
              // Add a Divider
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              // Payment Method Title
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15, bottom: 15),
                child: Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              // Payment Methods
              Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width) - 35,
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pay Upon Collection",
                                  style: TextStyle(
                                    fontFamily: 'San Francisco UI',
                                    fontSize: 18,
                                  )),
                              Container(
                                child: Radio(
                                  value: 1,
                                  groupValue: _radioValue1,
                                  activeColor: Colors.red,
                                  onChanged: _handleRadioValueChange1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width) - 35,
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Maybank QRPay",
                                  style: TextStyle(
                                    fontFamily: 'San Francisco UI',
                                    fontSize: 18,
                                  )),
                              Container(
                                child: Radio(
                                  value: 2,
                                  groupValue: _radioValue1,
                                  activeColor: Colors.red,
                                  onChanged: _handleRadioValueChange1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width) - 35,
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Touch 'n Go eWallet",
                                  style: TextStyle(
                                    fontFamily: 'San Francisco UI',
                                    fontSize: 18,
                                  )),
                              Container(
                                child: Radio(
                                  value: 3,
                                  groupValue: _radioValue1,
                                  activeColor: Colors.red,
                                  onChanged: _handleRadioValueChange1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ])),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
              elevation: 0.0,
              color: Colors.white,
              child: Container(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontFamily: 'San Francisco UI',
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "RM5.50",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'San Francisco Pro'),
                      ),
                    ],
                  ),
                ),
                Row(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Material(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: MaterialButton(
                            minWidth: 300,
                            height: 65,
                            onPressed: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Place Order",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'San Francisco Pro',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            color: Colors.red,
                          ),
                        ))
                  ],
                ),
              ]))),
        ),
        onWillPop: () async => false);
  }
}

class MyCheckOutPageTwo extends StatefulWidget {
  @override
  CheckOutPageTwo createState() => CheckOutPageTwo();
}

// ignore: must_be_immutable
class CheckOutPageTwo extends State<MyCheckOutPageTwo> {
  int _radioValue1 = 0;

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: ListView(
        children: [
          // Order Summary
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, top: 15, bottom: 10),
              child: Column(
                children: [
                  Text(
                    "Order Summary",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'San Francisco Pro',
                        color: Colors.grey),
                  ),
                ],
              )),
          // Fried Bee Hoon Order
          Container(
              color: Colors.white,
              child: Row(
                children: [
                  // Fried Bee Hoon Order
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 20, top: 15, bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image of Fried Bee Hoon and Name
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('x',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 2, right: 5),
                                  child: Text('1',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            'Fried Bee Hoon',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'San Francisco Pro',
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: Text('Add On: Omelette  x 1',
                                              style: TextStyle(
                                                fontFamily: 'San Francisco UI',
                                                fontWeight: FontWeight.normal,
                                              )),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          // Count of Fried Bee Hoon
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '4.50',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'San Francisco Pro',
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ))
                  // Add On: Omelette
                ],
              )),
          // Tom Yam Ayam Order
          Container(
              color: Colors.white,
              child: Row(
                children: [
                  // Tom Yam Ayam Order
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 20, top: 15, bottom: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Image of Fried Bee Hoon and Name
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('x',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 2, right: 5),
                                  child: Text('1',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'Tom Yam Ayam',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'San Francisco Pro',
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          // Count of Tom Yam Ayam
                          Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  '5.00',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'San Francisco Pro',
                                  ),
                                ),
                              ),
                            ],
                          )),
                        ],
                      ))
                  // Add On: Omelette
                ],
              )),
          // Add a Divider
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          // Subtotal and Total and all
          Container(
              color: Colors.white,
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Column of titles
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        child: Text("Subtotal",
                            style: TextStyle(
                              fontFamily: 'San Francisco UI',
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        child: Text("Service fee",
                            style: TextStyle(
                              fontFamily: 'San Francisco UI',
                            )),
                      )
                    ],
                  )),
                  // Column of prices
                  Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        child: Text("9.50",
                            style: TextStyle(
                              fontFamily: 'San Francisco UI',
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1),
                        child: Text("1.00",
                            style: TextStyle(
                              fontFamily: 'San Francisco UI',
                            )),
                      )
                    ],
                  )),
                ],
              )),
          // Add a Divider
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
          ),
          // Add Ons Title
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                "Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          // Payment Methods
          Container(
              color: Colors.white,
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width) - 35,
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pay Upon Collection",
                              style: TextStyle(
                                fontFamily: 'San Francisco UI',
                                fontSize: 18,
                              )),
                          Container(
                            child: Radio(
                              value: 1,
                              groupValue: _radioValue1,
                              activeColor: Colors.red,
                              onChanged: _handleRadioValueChange1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width) - 35,
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Maybank QRPay",
                              style: TextStyle(
                                fontFamily: 'San Francisco UI',
                                fontSize: 18,
                              )),
                          Container(
                            child: Radio(
                              value: 2,
                              groupValue: _radioValue1,
                              activeColor: Colors.red,
                              onChanged: _handleRadioValueChange1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width) - 35,
                      padding: EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Touch 'n Go eWallet",
                              style: TextStyle(
                                fontFamily: 'San Francisco UI',
                                fontSize: 18,
                              )),
                          Container(
                            child: Radio(
                              value: 3,
                              groupValue: _radioValue1,
                              activeColor: Colors.red,
                              onChanged: _handleRadioValueChange1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ])),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Colors.white,
          child: Container(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontFamily: 'San Francisco UI',
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "RM10.50",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'San Francisco Pro'),
                  ),
                ],
              ),
            ),
            Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: MaterialButton(
                        minWidth: 300,
                        height: 65,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProcessingPage()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Place Order",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
          ]))),
    );
  }
}

class MyProcessingPage extends StatefulWidget {
  @override
  ProcessingPage createState() => ProcessingPage();
}

// ignore: must_be_immutable
class ProcessingPage extends State<MyProcessingPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPreparingPage()),
            ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Add the GIF here
          Image.asset(
            "images/takeorder.gif",
            fit: BoxFit.contain,
          ),
          // Processing text
          Container(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Text("Processing Your Order",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'San Francisco Pro',
                )),
          ),
          // Progress Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}

class MyPreparingPage extends StatefulWidget {
  @override
  PreparingPage createState() => PreparingPage();
}

// ignore: must_be_immutable
class PreparingPage extends State<MyPreparingPage> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.push(
              context,
              // MaterialPageRoute(
              //   builder: (context) => MyPreparingPageTwo(),
              // ),
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    MyPreparingPageTwo(),
                transitionDuration: Duration(seconds: 0),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // Enable this later to remove back button
        // automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 15),
        scrollDirection: Axis.vertical,
        children: [
          // One Window for Island One
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  // Cafe Name
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Village 2 Island One Cafe',
                      style: TextStyle(
                        fontFamily: 'San Francisco Pro',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Food ordered
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Row(children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text('x',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2, right: 5),
                                child: Text('1',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Fried Bee Hoon',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'San Francisco Pro',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text('Add On: Omelette  x 1',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'San Francisco UI',
                                              fontWeight: FontWeight.normal,
                                            )),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ])),
                  // GIF of current action
                  Image.asset(
                    "images/preparing.gif",
                    height: 200,
                  ),
                  // What is the current action
                  Container(
                    child: Text(
                      'Preparing Meal',
                      style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Progress Bar
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: MilestoneProgress(
                      completedMilestone: 1,
                      maxIconSize: 35,
                      totalMilestones: 3,
                      width: MediaQuery.of(context).size.width * 0.75,
                      completedIconData: Icons.circle, //optional
                      completedIconColor: Colors.red, //optional
                      nonCompletedIconData: Icons.circle, //optional
                      incompleteIconColor: Colors.grey, //optional
                    ),
                  ),
                  // Duration Remaining
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Less than 5 minutes',
                      style: TextStyle(
                        fontFamily: 'San Francisco Pro',
                        fontSize: 26,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          // One Window for Gee & S
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  // Cafe Name
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Village 2 Gee & S',
                      style: TextStyle(
                        fontFamily: 'San Francisco Pro',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Food ordered
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Row(children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text('x',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2, right: 5),
                                child: Text('1',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Tom Yam Ayam',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'San Francisco Pro',
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ])),
                  // GIF of current action
                  Image.asset(
                    "images/completed.gif",
                    height: 200,
                  ),
                  // What is the current action
                  Container(
                    child: Text(
                      'Ready for Collection',
                      style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Progress Bar
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: MilestoneProgress(
                      completedMilestone: 2,
                      maxIconSize: 35,
                      totalMilestones: 3,
                      width: MediaQuery.of(context).size.width * 0.75,
                      completedIconData: Icons.circle, //optional
                      completedIconColor: Colors.red, //optional
                      nonCompletedIconData: Icons.circle, //optional
                      incompleteIconColor: Colors.grey, //optional
                    ),
                  ),
                  // Duration Remaining
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Ready!',
                      style: TextStyle(
                        fontFamily: 'San Francisco Pro',
                        fontSize: 26,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPreparingPageTwo extends StatefulWidget {
  @override
  PreparingPageTwo createState() => PreparingPageTwo();
}

// ignore: must_be_immutable
class PreparingPageTwo extends State<MyPreparingPageTwo> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CompletedOrders()),
            ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // Enable this later to remove back button
        // automaticallyImplyLeading: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 15),
        scrollDirection: Axis.vertical,
        children: [
          // One Window for Island One
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  // Cafe Name
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Village 2 Island One Cafe',
                      style: TextStyle(
                        fontFamily: 'San Francisco Pro',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Food ordered
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Row(children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text('x',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2, right: 5),
                                child: Text('1',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          'Fried Bee Hoon',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'San Francisco Pro',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text('Add On: Omelette  x 1',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'San Francisco UI',
                                              fontWeight: FontWeight.normal,
                                            )),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ])),
                  // GIF of current action
                  Image.asset(
                    "images/completed.gif",
                    height: 200,
                  ),
                  // What is the current action
                  Container(
                    child: Text(
                      'Ready for Collection',
                      style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Progress Bar
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: MilestoneProgress(
                      completedMilestone: 2,
                      maxIconSize: 35,
                      totalMilestones: 3,
                      width: MediaQuery.of(context).size.width * 0.75,
                      completedIconData: Icons.circle, //optional
                      completedIconColor: Colors.red, //optional
                      nonCompletedIconData: Icons.circle, //optional
                      incompleteIconColor: Colors.grey, //optional
                    ),
                  ),
                  // Duration Remaining
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Ready!',
                      style: TextStyle(
                        fontFamily: 'San Francisco Pro',
                        fontSize: 26,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          // One Window for Gee & S
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                alignment: Alignment.centerLeft,
                child: Column(children: [
                  // Cafe Name
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Village 2 Gee & S',
                      style: TextStyle(
                        fontFamily: 'San Francisco Pro',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  // Food ordered
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: Row(children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text('x',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 2, right: 5),
                                child: Text('1',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Tom Yam Ayam',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'San Francisco Pro',
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ])),
                  // GIF of current action
                  Image.asset(
                    "images/collected.gif",
                    height: 200,
                  ),
                  // What is the current action
                  Container(
                    child: Text(
                      'Order Collected',
                      style: TextStyle(
                        fontFamily: 'San Francisco UI',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  // Progress Bar
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: MilestoneProgress(
                      completedMilestone: 3,
                      maxIconSize: 35,
                      totalMilestones: 3,
                      width: MediaQuery.of(context).size.width * 0.75,
                      completedIconData: Icons.circle, //optional
                      completedIconColor: Colors.red, //optional
                      nonCompletedIconData: Icons.circle, //optional
                      incompleteIconColor: Colors.grey, //optional
                    ),
                  ),
                  // Duration Remaining
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Completed!',
                      style: TextStyle(
                        fontFamily: 'San Francisco Pro',
                        fontSize: 26,
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class CompletedOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // Enable this later to remove back button
        // automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            //Image for Thank You
            Image.asset(
              "images/thankyou.gif",
              fit: BoxFit.fill,
            ),
            // Text for Thank You
            Container(
                padding: EdgeInsets.only(top: 30),
                child: Text('Thank you for your order!',
                    style: TextStyle(
                      fontFamily: 'San Francisco UI',
                      fontSize: 24,
                    ))),
            Container(
                child: Text('Enjoy your meal!',
                    style: TextStyle(
                      fontFamily: 'San Francisco UI',
                      fontSize: 24,
                    ))),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          color: Colors.transparent,
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: MaterialButton(
                        minWidth: 300,
                        height: 65,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SelectCafePage()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Done',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'San Francisco Pro',
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
