import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nie/login.dart';



Map<String, Widget Function(BuildContext)> Router() {
	var routes = {
		'/': (_) => Login()
	};
	return routes;
}