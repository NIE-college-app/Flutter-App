import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nie/login.dart';
import 'package:nie/loginPage.dart';
import 'package:nie/router.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/services/secureStorage.dart';

final storage = new FlutterSecureStorage();
dynamic check;

void main() {
	runApp(wrapper());
}

class wrapper extends StatefulWidget {
  @override
  _wrapperState createState() => _wrapperState();
}

class _wrapperState extends State<wrapper> {

	@override
  void initState() {
		super.initState();
		getStorage().then((loginStaus) {
			if(loginStaus != null){

			}
			setState(() {
				check = loginStaus;
			});
		});
	}

  @override
  Widget build(BuildContext context) {
    return App();
  }
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
		routes: Router(),
		home: check == 'true' ? Login() : loginPage(),
	);
  }
}
