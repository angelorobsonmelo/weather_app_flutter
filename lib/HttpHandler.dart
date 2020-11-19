import 'package:http/http.dart' as http;
import 'package:weather_app/WeatherData.dart';
import 'dart:convert';
import 'GetLocation.dart';

class HttpHandler {
  static const String _apiKey = 'c0e03378ac246a2c32f89363cbcfc096';
  static GetLocation _getLocation = GetLocation();

  static Future<WeatherData> getTemp() async {
    var _getLatLon = await _getLocation.getCurrentLocation();

    if (_getLatLon != null) {
      http.Response response = await http.get(
          'http://api.openweathermap.org/data/2.5/weather?lat=${_getLatLon.latitude}&lon=${_getLatLon.longitude}&appid=$_apiKey&units=metric');

      if (response.statusCode == 200) {
        return WeatherData.fromJSON(json.decode(response.body));
      } else {
        throw Exception('Failed to fitch weather data');
      }
    }
  }
}
