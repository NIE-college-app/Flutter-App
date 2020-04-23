import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/main.dart';
import 'package:nie/services/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:nie/login.dart';


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
			backgroundColor: AppColor,
		),
		body: Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					Image.asset(
						"assets/images/logo.png"
					),
					SignInButton(
						Buttons.GoogleDark,
						onPressed: () {
							handleSignIn().then((FirebaseUser user) {
								User per = new User(user.uid, user.displayName, user.photoUrl, user.email, user.phoneNumber);
								var ex = per.set();
								setState(() async {
									data = ex;
									loginStatus = 'true';
									await storage.write(key: 'login', value: 'true');
									Navigator.pushReplacement(
										context,
										new MaterialPageRoute(
											builder: (BuildContext context) => Login()));
								});
							});
						},
						text: "Sign In with Google",

					)
				],
			)
		),
	);
  }
}




