import 'package:flutter/material.dart';
Widget currentweather(IconData icon, String temp, String location){
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
          color: Colors.orange,
          size: 64.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          '$temp F ',
          style: TextStyle(
            fontSize: 46,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(location,
          style: TextStyle(
              fontSize: 18.0,
              color: Colors.black38
          ),
        )
      ],
    ),

  );
}
