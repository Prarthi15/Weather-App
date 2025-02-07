import 'package:http/http.dart';
import 'dart:convert';

class worker {
  String location;
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  worker({required this.location}) {
    location = this.location;
  }

  //method
  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=f58af5b0e5382ae45e0ca60f09c03419"));
      Map data = jsonDecode(response.body);
      print(response.body);

      //Getting Temp,Humidiy
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      //Getting air_speed
      Map wind = data['wind'];
      double getAir_speed = wind["speed"] * 3.6;

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des = weather_main_data['main'];
      String getDesc = weather_main_data["description"];

      //Assigning Values
      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      description = getDesc;
      main = getMain_des;
      icon = weather_main_data["icon"].toString();
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data!";
      main = "NA";
      icon = "03n";
    }
  }
}
