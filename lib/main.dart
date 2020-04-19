import 'package:flutter/material.dart';
import 'package:nie/router.dart';
import 'package:nie/globalvariables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'loginPage.dart';

Widget landing;

void main() async{
	SharedPreferences.setMockInitialValues({});
	SharedPreferences.getInstance().then((SharedPreferences prefs) {
		var logStat = prefs.getBool('loginStatus');
		print(logStat);
		if(logStat != null) {
			loginStatus = logStat;
			landing = loginStatus ? Login() : loginPage();
			runApp(App());
		}
		else {
			loginStatus = false;
			landing = loginStatus ? Login() : loginPage();
			runApp(App());
		}
	});
}


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
		initialRoute: '/',
		routes: Router(),
	);
  }
}
