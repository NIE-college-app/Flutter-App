import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nie/login.dart';
import 'package:nie/settings.dart';



Map<String, Widget Function(BuildContext)> Router() {
	var routes = {
		'/': (_) => Login(),
		'/settings': (_) => Settings(),
	};
	return routes;
}