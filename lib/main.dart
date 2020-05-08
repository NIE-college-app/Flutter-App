import 'dart:convert';

import 'package:flare_flutter/flare_actor.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nie/login.dart';
import 'package:nie/loginPage.dart';
import 'package:nie/router.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/services/secureStorage.dart';

final storage = new FlutterSecureStorage();

void main() {
//	Student student = await loadStudent();
	runApp(wrapper());
}



//Widget landing = Login();
Widget landing = loginPage();
class wrapper extends StatefulWidget {
  @override
  _wrapperState createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {


	@override
	void initState() {
		super.initState();
		setState(() {
			checklog().then((check) {
				if(check == 'true') {
					landing = Login();
				}
				else if(check == 'false' || checklog  == null) {
					landing = loginPage();
				}
			});
		});
	}

	Future<String> checklog() async {
		return await storage.read(key: 'logged');
	}

  @override
  Widget build(BuildContext context) {
    return App();
  }
}


class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

	@override
	void initState() {
		super.initState();
		setState(() {
			checklog().then((check) {
				if(check == 'true') {
					landing = Login();
				}
				else if(check == 'false' || checklog  == null) {
					landing = loginPage();
				}
			});
		});
	}

	Future<String> checklog() async {
		return await storage.read(key: 'logged');
	}

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
			routes: Router(),
			home: SplashScreen(
				seconds: 8,
				backgroundColor: Colors.black,
				loaderColor: AppColor,
				image: Image.asset('assets/animation/loading.gif'),
				photoSize: 150,
				navigateAfterSeconds: landing,
			)
		);
	}
}

