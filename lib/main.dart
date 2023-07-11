import 'package:assainment_9/service/weather_servicea.dart';
import 'package:assainment_9/view/current_weather.dart';
import 'package:flutter/material.dart';

import 'model/weather_model.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData()async{
    data = await client.getCurrentWeather('Dhaka');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor:Color(0xFFf9f9f9) ,
        title: Text('Weather App',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),color: Colors.black,),
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentweather(Icons.sunny, "${data!.temp}", '${data!.cityname}'),
                SizedBox(
                  height: 50.0,
                ),
                Text('Additional Information',style: TextStyle(fontSize: 24.0,color: Colors.black54,fontWeight: FontWeight.bold)),
                Divider(),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
