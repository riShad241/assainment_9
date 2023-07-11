import 'dart:convert';


import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location)async{
    var endpoint = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=2edcd388e814a1a581de0b6c3361e6c5');

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityname);
    return Weather.fromJson(body);
  }
}