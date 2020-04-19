import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nie/AboutPost.dart';
import 'package:nie/AboutProf.dart';
import 'package:nie/Imagehandling.dart';
import 'package:nie/contacts.dart';
import 'package:nie/timetable.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/login.dart';
import 'package:nie/loginPage.dart';

Widget landing = !loginStatus ? Login() : loginPage();

Map<String, Widget Function(BuildContext)> Router() {

	var routes = {
		'/': (_) => landing,
		'/timetable': (_) => TimeTable(),
		'/imageUpload': (_) => ImageUplaod(),
		'/contacts': (_) =>  Contacts(),
		'/aboutProf': (_) => AboutProf(),
		'/aboutPost':(_)=>AboutPost(),
	};
	return routes;
}