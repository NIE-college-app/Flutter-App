import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nie/Colfeed.dart';

var AppColor = Colors.blue;

bool dnd = false;

Icon picker = Icon(
	CupertinoIcons.photo_camera,
	size: 90,
);

var textpicker = 'Take a picture';

ImageSource source = ImageSource.gallery;

var AccentColor = Colors.black;

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

Widget body = Colfeed();


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

String loginStatus = 'false';

class User {
	final String uid;
	final String photoUrl;
	final String number;
	final String displayName;
	final String email;

	User(this.uid, this.displayName, this.photoUrl, this.email, this.number);

	Map<String, dynamic> set() {
		 return {
			"uid": uid,
			"displayName": displayName,
			"email": email,
			"USN": '',
			'contact': number,
			"photoUrl": photoUrl
		};
	}

}

List<Map<String,String>> oldPostData = [
	{
		'title':"IEEE Programming League 3.0",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.reallylongwebsitelinkhereright.com",
		"event":'true',
		'photoUrl':'https://instagram.fmaa1-3.fna.fbcdn.net/v/t51.2885-15/e35/s1080x1080/93373620_327510958229201_7505430158380097867_n.jpg?_nc_ht=instagram.fmaa1-3.fna.fbcdn.net&_nc_cat=105&_nc_ohc=MzGB2o7bTOwAX_65GwF&oh=12d381136cc60275d719c87331838898&oe=5EC626AC',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed part 2",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.smollynk:3.com",
		"event":'true',
		'photoUrl':'https://i.redd.it/phje3htj0dn31.jpg',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title deja vu edition",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed returns",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed again and again",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed but different",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed right????",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed???",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed the original sequel",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed part 69420",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed stuck in limbo",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed the final edition",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed the final final edition",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://picsum.photos/200',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed part 2",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://i.redd.it/phje3htj0dn31.jpg',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
	{
		'title':"This is an interesting title indeed part 2",
		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
		'link':"www.example.com",
		"event":'true',
		'photoUrl':'https://i.redd.it/phje3htj0dn31.jpg',
		'Audience':'one',
		'Date':'2020-04-03',
		'Time':'03:08:00.000'
	},
];

