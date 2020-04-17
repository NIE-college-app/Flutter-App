import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nie/Allfeed.dart';

var AppColor = Appcolors[4];

bool dnd = false;

Icon picker = Icon(
	CupertinoIcons.photo_camera,
	size: 90,
);

var textpicker = 'Take a picture';

ImageSource source = ImageSource.gallery;

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


List<Map<String,Map<String,String>>> faculty =[
	{
		"Iresh": {
			"About": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			"Read More": "http://www.example.com/",
			"image": 'https://cdn.dribbble.com/users/1744884/screenshots/3883904/wolf_head_logo.jpg',
			"num": "9339524939",
			"email": "randomain@mail.com",
			"designation": "Proffessor"
		}
	},
	{
		"Utkarsh": {
			"About": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			"Read More": "http://www.example.com/",
			"image": 'https://cdn.dribbble.com/users/1744884/screenshots/3883904/wolf_head_logo.jpg',
			"num": "9936424939",
			"email": "randomain235@mail.com",
			"designation": "Asst. Proffessor"
		}
	},
	{
		"Adelaid": {
			"About": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			"Read More": "http://www.example.com/",
			"image": 'https://cdn.dribbble.com/users/1744884/screenshots/3883904/wolf_head_logo.jpg',
			"num": "234234234",
			"email": "randomai637n@mail.com",
			"designation": "Proffessor"
		}
	},
	{
		"Ellen": {
			"About": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			"Read More": "http://www.example.com/",
			"image": 'https://preview.redd.it/v4mbzpjcc6t41.png?width=640&crop=smart&auto=webp&s=f98153fba920bc62ab9e3b71fc8e89abe75bc2d9',
			"num": "12312312312",
			"email": "randomain21123@mail.com",
			"designation": "Asst. Proffessor"
		}
	},
	{
		"Oprah": {
			"About": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			"Read More": "http://www.example.com/",
			"image": 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQY10Tag71MjhNKGDsOOCKoiKELhsPWpJF1bJydPoh-yxc_k456&usqp=CAU',
			"num": "345235274532",
			"email": "randomain2324@mail.com",
			"designation": "Proffessor"
		}
	},
	{
		"Betty bop":{
			"About":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
			"Read More": "http://www.example.com/",
			"image":'https://preview.redd.it/gfuvr6rv87t41.jpg?width=640&crop=smart&auto=webp&s=144e5684bf812abc6453ecc57b6eaef9ee3e122a',
			"num":"4579341043",
			"email":"randomain2353@mail.com",
			"designation":"Asst. Proffessor"
		}
	}
];

