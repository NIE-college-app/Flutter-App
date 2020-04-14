import 'package:flutter/material.dart';
import 'package:nie/router.dart';


void main() => runApp(App());


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
		title: 'NIE college App',
		initialRoute: '/',
		routes: Router(),
	);
  }
}
