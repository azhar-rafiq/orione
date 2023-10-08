import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// import 'package:stylish_bottom_bar/stylish_nav.dart';

import 'package:orione/chatbot.dart';
import 'package:orione/planet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orione',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: const Color.fromARGB(44, 49, 66, 255),
            primaryColorDark: const Color.fromARGB(255, 0, 99, 213),
            cardColor: const Color.fromARGB(255, 129, 198, 255),
            accentColor: const Color.fromARGB(255, 80, 174, 225)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Orione'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Container(
                //   padding: EdgeInsets.only(top: 100),
                //   child: Image.asset('images/logo.png',
                //       color: Color.fromRGBO(255, 255, 255, 0.5),
                //       colorBlendMode: BlendMode.modulate,
                //       height: 145,
                //       width: 145),
                // ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: const Text(
                    "Let's Explore",
                    style: TextStyle(
                        // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  // color: Colors.green,
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 30, right: 30),
                  child: const Text(
                    "The milky way and beyond",
                    style: TextStyle(
                        // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                        color: Colors.white,
                        fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  // color: Colors.green,
                  padding: EdgeInsets.only(bottom: 0, left: 30, right: 30),
                  child: Text(
                    "Most Popular →",
                    style: TextStyle(
                        // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                        color: Colors.white,
                        fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 40, bottom: 40),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 67, 131, 161),
                                    // gradient: LinearGradient(
                                    //   tileMode: TileMode.decal,
                                    //   colors: <Color>[
                                    //     Color.fromARGB(255, 255, 255, 255),
                                    //     Color.fromARGB(255, 200, 201, 232),
                                    //     Color.fromARGB(255, 174, 157, 169),
                                    //   ],
                                    // ),
                                  ),
                                ),
                              ),
                              Image.asset('images/earth.png',
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                  colorBlendMode: BlendMode.modulate,
                                  height: 145,
                                  width: 145),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  _pushPage(context, planet());
                                },
                                child: const Text(
                                  '\n\n\n\nEarth',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(fontSize: 23),
                                ),
                                onPressed: () {
                                  _pushPage(context, planet());
                                },
                                child: const Text(
                                  '\n\n\n\n\n\n\nThe Blue Planet',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 40, bottom: 40),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 191, 78, 25),
                                    // gradient: LinearGradient(
                                    //   tileMode: TileMode.decal,
                                    //   colors: <Color>[
                                    //     Color.fromARGB(255, 255, 255, 255),
                                    //     Color.fromARGB(255, 200, 201, 232),
                                    //     Color.fromARGB(255, 174, 157, 169),
                                    //   ],
                                    // ),
                                  ),
                                ),
                              ),
                              Image.asset('images/mars.png',
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                  colorBlendMode: BlendMode.modulate,
                                  height: 145,
                                  width: 145),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  _pushPage(context, chatbot());
                                },
                                child: const Text(
                                  '\n\n\n\nMars',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(fontSize: 23),
                                ),
                                onPressed: () {
                                  _pushPage(context, chatbot());
                                },
                                child: const Text(
                                  '\n\n\n\n\n\n\nThe Red Planet',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.green,
                  padding: EdgeInsets.only(bottom: 20, left: 30, right: 30),
                  child: Text(
                    "More to travel →",
                    style: TextStyle(
                        // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                        color: Colors.white,
                        fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 40, bottom: 40),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 103, 177, 212),
                                    // gradient: LinearGradient(
                                    //   tileMode: TileMode.decal,
                                    //   colors: <Color>[
                                    //     Color.fromARGB(255, 255, 255, 255),
                                    //     Color.fromARGB(255, 200, 201, 232),
                                    //     Color.fromARGB(255, 174, 157, 169),
                                    //   ],
                                    // ),
                                  ),
                                ),
                              ),
                              Image.asset('images/uranus.png',
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                  colorBlendMode: BlendMode.modulate,
                                  height: 145,
                                  width: 145),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  _pushPage(context, chatbot());
                                },
                                child: const Text(
                                  '\n\n\n\nUranus',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(fontSize: 23),
                                ),
                                onPressed: () {
                                  _pushPage(context, chatbot());
                                },
                                child: const Text(
                                  '\n\n\n\n\n\n\nThe Ice Giant',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 40, bottom: 40),
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 82, 95, 188),
                                    // gradient: LinearGradient(
                                    //   tileMode: TileMode.decal,
                                    //   colors: <Color>[
                                    //     Color.fromARGB(255, 255, 255, 255),
                                    //     Color.fromARGB(255, 200, 201, 232),
                                    //     Color.fromARGB(255, 174, 157, 169),
                                    //   ],
                                    // ),
                                  ),
                                ),
                              ),
                              Image.asset('images/neptune.png',
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                  colorBlendMode: BlendMode.modulate,
                                  height: 145,
                                  width: 145),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  _pushPage(context, chatbot());
                                },
                                child: const Text(
                                  '\n\n\n\nNeptune',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(fontSize: 23),
                                ),
                                onPressed: () {
                                  _pushPage(context, planet());
                                },
                                child: const Text(
                                  '\n\n\n\n\n\n\nThe Big Blue',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 51, 98, 124),
        currentIndex: screenIndex,
        onTap: clickBottomNav,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.share_outlined,
            ),
            title: const Text('Explore'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.chat_bubble,
            ),
            title: const Text('Ask'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              Icons.person_2_rounded,
            ),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }

  void clickBottomNav(int index) {
    setState(() {
      screenIndex = index;

      if (index == 1) {
        _pushPage(context, const chatbot());
      } else {}
    });
  }
}
