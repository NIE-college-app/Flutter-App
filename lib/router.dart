import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nie/AboutPost.dart';
import 'package:nie/AboutProf.dart';
import 'package:nie/Imagehandling.dart';
import 'package:nie/contacts.dart';
import 'package:nie/pdfBiew.dart';
import 'package:nie/posts.dart';
import 'package:nie/register.dart';
import 'package:nie/timetable.dart';

import 'main.dart';

Map<String, Widget Function(BuildContext)> Router() {

	var routes = {
		'/timetable': (_) => TimeTable(),
		'/imageUpload': (_) => ImageUplaod(),
		'/contacts': (_) =>  Contacts(),
		'/aboutProf': (_) => ProfilePage(),
		'/aboutPost':(_)=>ViewPostScreen(),
		'/Register':(_)=>SignupPage(),
		'/App':(_)=>App(),
		'/pdfView': (_) => pdfView(),
		'/posts': (_) => Posts()
	};
	return routes;
}