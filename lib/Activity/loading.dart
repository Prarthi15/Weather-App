import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Weather/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String loc = "Gwalior";
  late String icon;

  void startApp() async {
    worker instance = worker(location: loc);
    await instance.getData();

    temp = instance.temp ?? "";
    hum = instance.humidity ?? "";
    air_speed = instance.air_speed ?? "";
    des = instance.description ?? "";
    main = instance.main ?? "";
    loc = instance.location;
    icon = instance.icon ?? "";

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "loc_value": loc,
        "icon_value": icon,
      });
    });
  }

  @override
  void initState() {
    super.initState();

    // Retrieve the searchText argument if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map search = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
      if (search['searchText'] != null) {
        loc = search['searchText'];
      }
      startApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 180,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 240,
                width: 240,
              ),
              const Text(
                "Mausam App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              const SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[300],
        child: const Center(
          child: Text(
            "Made By Prarthi",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
