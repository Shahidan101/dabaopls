// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

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
        primarySwatch: colorCustom,
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
  TextStyle style = TextStyle(fontFamily: 'San Francisco Pro', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xfff83800),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SelectCafePage()),
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "images/logo.png",
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

class SelectCafePage extends StatelessWidget {
  @override
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
                                      color: Colors.amber[900],
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
                                      color: Colors.amber[900],
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
                                    color: Colors.amber[900],
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
                                    color: Colors.amber[900],
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
                                    color: Colors.amber[900],
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
                                    color: Colors.amber[900],
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
                                    color: Colors.amber[900],
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
                                    color: Colors.amber[900],
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
                        onPressed: () {},
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
                        color: Colors.amber.shade900,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
