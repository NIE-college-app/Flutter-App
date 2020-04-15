import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nie/globalvariables.dart';

Future Getweather() async {

	http.Response response = await http.get("http://api.openweathermap.org/data/2.5/weather?q=Mysore&appid=a6d1ab49148702f56599f1701143e91b");

	var weather = jsonDecode(response.body);
	temp = (weather["main"]["temp"] -273).toStringAsFixed(2) + "℃" ;

	if(weather['weather'][0]['main'].toString() == "Clear") {
		svgName = 'assets/svg/sun.svg';
	}
	else if(weather['weather'][0]['main'].toString() == "Rain") {
		svgName = 'assets/svg/rain.svg';
	}
	else if(weather['weather'][0]['main'].toString() == "Cloudy") {
		svgName = 'assets/svg/weather.svg';
	}
	else if(weather['weather'][0]['main'].toString() == "Windy") {
		svgName = 'assets/svg/wind.svg';
	}
	else {
		svgName = 'assets/svg/sun.svg';
	}
}