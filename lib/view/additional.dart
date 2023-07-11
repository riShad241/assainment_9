import 'package:flutter/material.dart';

TextStyle titleFont = TextStyle(fontWeight: FontWeight.w600,fontSize: 24 );
TextStyle titleinfo = TextStyle(fontWeight: FontWeight.w400,fontSize: 24 );

additionalInformattion(String wind, String humidity, String pressure, String feel_like){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('wind',style: titleFont),
                SizedBox(
                  height: 18.0,
                ),
                Text('pressure',style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wind,style: titleFont),
                SizedBox(
                  height: 18.0,
                ),
                Text(pressure,style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('feel_like',style: titleFont),
                SizedBox(
                  height: 18.0,
                ),
                Text('pressure',style: titleFont),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(humidity,style: titleFont),
                SizedBox(
                  height: 18.0,
                ),
                Text(feel_like,style: titleFont),
              ],
            ),
          ],
        )
      ],
    ),
  );
}