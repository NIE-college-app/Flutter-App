import 'package:flutter/material.dart';
import 'package:nie/Allfeed.dart';

var AppColor = Appcolors[4];

bool dnd = false;

var Appcolors = [
	Colors.pinkAccent[400],
	Colors.deepOrangeAccent[700],
	Colors.yellow[400],
	Colors.lightGreenAccent[700],
	Colors.indigoAccent[200]
];

var AccentColor = AccentColors[4];

var AccentColors = [
	Colors.red,
	Colors.blue,
	Colors.yellow,
	Colors.green,
	Colors.black38
];

var svgName = 'assets/svg/sun.svg';

var navcolors = Colors.white;

var title = 'NIE';

Map<String,dynamic> data={
	"displayName":"Uttkarsh Singh",
	"email":"randomain@mail.com",
	"USN":"4NI19CS053",
	'contact':"9412365372",
	"Semester":"3",
	"Branch":"CSE",
	"Section":"B",
	"photoUrl":"https://picsum.photos/250?image=9",
	"Groups":[
		"CSE",
		"Sem_3",
		"Section_B",
		"College"
	]
};
var temp = '';

Widget body = Allfeed();
