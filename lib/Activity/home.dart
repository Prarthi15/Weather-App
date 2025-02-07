// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  // initState runs when widget is created
  @override
  void initState() {
    super.initState();
    print("This is init state");
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    print("Set State Method Called");
  }

  // dispose is called when the widget is destroyed
  @override
  void dispose() {
    super.dispose();
    print("Widget is disposed");
  }

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    var cityName = [
      "Mumbai",
      "Chennai",
      "Dhar",
      "Indore",
      "Gwalior",
      "Jaipur",
      "Delhi",
      "London",
      "Paris",
      "Tokyo",
      "Japan",
      "New York",
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    String temp = (info["temp_value"].toString());
    String airSpeed = (info["air_speed_value"].toString());

    if (temp == "NA") {
      print("NA");
    } else {
      temp = (info["temp_value"].toString()).substring(0, 4);
      airSpeed = (info["air_speed_value"].toString()).substring(0, 4);
    }
    String humidity = (info["hum_value"]);
    String icon = info["icon_value"];
    String desc = info["des_value"];
    String location = info["loc_value"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue[800],
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(21, 101, 192, 1),
                  Color.fromRGBO(100, 181, 246, 1),
                ],
              ),
            ),
            child: Column(
              children: [
                //search waala container
                Container(
                  // color: Colors.grey, //if you are putting color in box decoration then dont put it in the container
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                            print("Blank Search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": searchController.text
                                });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search $city"),
                          onSubmitted: (value) {
                            Navigator.pushNamed(context, "/loading",
                                arguments: {"searchText": value});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                //First Container
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Image.network(
                              "https://openweathermap.org/img/wn/$icon@2x.png",
                              width: 60,
                              height: 60,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  desc,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "In $location",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //SEcond Container
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 220,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temp,
                                  style: const TextStyle(fontSize: 90),
                                ),
                                const Text(
                                  "C",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //Third and Fourth Container
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              airSpeed,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("km/hr")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: const EdgeInsets.all(26),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              humidity,
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            const Text("Percent")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Made by Prarthi",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Data Provided by OpenWeathermap.org",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// setState reruns the build function
// JSON stands for JavaScript Object Notation, 
// a text-based format for storing and exchanging data between web applications and servers.
// Async - Functions that run asynchronously and may have delayed results.
// Future.delayed - A function that starts execution after a set delay.
