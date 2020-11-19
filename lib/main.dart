import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/DisplayWeatherData.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  DisplayWeatherData _displayWeatherData = DisplayWeatherData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: <Widget>[
          Container(
            child: displayImage(),
          ),
          Container(
            child: _displayWeatherData,
          )
        ],
      )),
    );
  }

  displayImage() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return Image.asset("images/dayTime.jpg");
    }
    if (hour < 17) {
      return Image.asset("images/dayTime.jpg");
    }
    return Image.asset("images/nightTime.jpg");
  }

}
