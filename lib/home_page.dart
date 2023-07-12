import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'stylr.dart';



class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String? city;
  String? temperature;
  String? condition;
  String? lastUpdate;
  String? image;
  String? maxTemp;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    var url =
        'https://api.weatherapi.com/v1/current.json?key=f79f1ab3fa1b46ceae5151004230907&q=bangladesh&aqi=no';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      city = jsonData['location']['name'].toString();
      temperature = jsonData['current']['temp_c'].toString();
      condition = jsonData['current']['condition']['text'];
      lastUpdate = jsonData['current']['last_updated'];
      image = jsonData['current']['condition']['icon'];
      maxTemp = jsonData['current']['feelslike_c'].toString();


      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5130A7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF7B51FB),
        title: const Text('Weather App'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 70),
            Text(
              city ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('Last Update: $lastUpdate', style: TextStyle(fontSize: 20, color: Colors.white),),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Image.network('api.weatherapi.com//cdn.weatherapi.com/weather/64x64/night/119.png', errorBuilder: (_, __, ___){
                  return const Icon(Icons.sunny, color: Colors.white,);

                },),
                const SizedBox(width: 20),
                Text(
                  "${temperature ?? ''}°",
                  style: const TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Text('Max temp: ${maxTemp?? "" }°',style: maxMintempStyle),
                    /// in this api there is no Minimum temperature.
                    Text('Min temp: 25°',style: maxMintempStyle),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Text(
              condition ?? '',
              style: weatherCondition,
            ),
          ],
        ),
      ),
    );
  }
}