import 'package:flutter/material.dart';
import 'package:nie/router.dart';
import 'package:nie/globalvariables.dart';


void main() => runApp(App());


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
		theme: ThemeData(
			brightness: Brightness.light,
			primaryTextTheme: Typography(platform: TargetPlatform.android).black,
			textTheme: Typography(platform: TargetPlatform.android).black,
			iconTheme: IconThemeData(
				color: Colors.white
			)
		),
		darkTheme: ThemeData(
			brightness: Brightness.light,
			primaryTextTheme: Typography(platform: TargetPlatform.android).black,
			textTheme: Typography(platform: TargetPlatform.android).black,
			iconTheme: IconThemeData(
				color: Color(0x303030)
			)
		),
		title: title + 'college App',
		initialRoute: loginStatus ? '/' : '/loginE',
		routes: Router(),
	);
  }
}
