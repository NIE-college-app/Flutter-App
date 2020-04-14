import 'package:flutter/material.dart';
import 'package:nie/router.dart';
import 'package:nie/globalvariables.dart';


void main() => runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
		title: title + 'college App',
		initialRoute: '/',
		routes: Router(),
	);
  }
}
