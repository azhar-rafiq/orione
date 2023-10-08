import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// import 'dart:convert';
import 'chatMsg.dart';
import 'package:linkify/linkify.dart';

class planet extends StatefulWidget {
  const planet({super.key});

  final String title = "Planet Info";

  @override
  State<planet> createState() => planetState();
}

class planetState extends State<planet> {
  @override
  void initState() {}

  int idUser = 1;
  String name = "Budi";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        // color: Color.fromARGB(255, 55, 60, 69),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 15),
                ),
                Image.asset('images/earth_real.png',
                    color: Color.fromRGBO(255, 255, 255, 1),
                    colorBlendMode: BlendMode.modulate,
                    height: 145,
                    width: 145),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: const Text(
                    "Earth",
                    style: TextStyle(
                        // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "The Blue Planet",
                    style: TextStyle(
                        // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 5),
                  child: const Text(
                    "Earth is the third planet from the Sun and is the largest of the terrestrial planet. Unlike the other planets in the solar system that named after classic deities the Earth's name comes from the Anglo-Saxon word 'earda' which means ground or soil.\n",
                    style: TextStyle(
                        // backgroundColor: Color.fromRGBO(74, 57, 119, 0.494),
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 67, 73, 81),
                  padding: const EdgeInsets.only(left: 30, top: 5, bottom: 5),
                  child: InkWell(
                    child: Text(
                      "More to know",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20),
                    ),
                    onTap: () {
                      launchUrl(
                          Uri.parse("https://science.nasa.gov/earth/facts/"));
                    },
                  ),
                ),
                Container()
              ]),
        ),
      ),
    );
  }
}
