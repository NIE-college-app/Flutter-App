import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/services/auth.dart';


class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			title: Text("Login to access NIE App"),
		),
		body: Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					Image.asset(
						"assets/images/logo.png"
					),
					OutlineButton.icon(
						onPressed: () {
							handleSignIn().then((FirebaseUser user) {
								User per = new User(user.uid, user.displayName, user.photoUrl, user.email, user.phoneNumber);
								var ex = per.set();
								setState(() {
								  data = ex;
								  loginStatus = true;
								});
								Navigator.of(context).pushNamed('/');
							});
						},
						icon: Icon(Icons.g_translate),
						label: Text("Login"),
						color: AppColor,
						splashColor: AppColor,
						focusColor: AppColor,
						highlightColor: AppColor,
					),
				],
			)
		),
	);
  }
}
