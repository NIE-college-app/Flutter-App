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
		resizeToAvoidBottomPadding: false,
		body: Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Container(
					child: Stack(
						children: <Widget>[
							Container(
								padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
								child: Text('Hello',
									style: TextStyle(
										fontSize: 80.0, fontWeight: FontWeight.bold)),
							),
							Container(
								padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
								child: Text('There',
									style: TextStyle(
										fontSize: 80.0, fontWeight: FontWeight.bold)),
							),
							Container(
								padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
								child: Text('.',
									style: TextStyle(
										fontSize: 80.0,
										fontWeight: FontWeight.bold,
										color: AppColor)),
							)
						],
					),
				),
				Container(
					padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
					child: Column(
						children: <Widget>[
							TextField(
								decoration: InputDecoration(
									labelText: 'EMAIL',
									labelStyle: TextStyle(
										fontFamily: 'Montserrat',
										fontWeight: FontWeight.bold,
										color: Colors.grey),
									focusedBorder: UnderlineInputBorder(
										borderSide: BorderSide(color: AppColor))),
							),
							SizedBox(height: 20.0),
							TextField(
								decoration: InputDecoration(
									labelText: 'PASSWORD',
									labelStyle: TextStyle(
										fontFamily: 'Montserrat',
										fontWeight: FontWeight.bold,
										color: Colors.grey),
									focusedBorder: UnderlineInputBorder(
										borderSide: BorderSide(color: AppColor))),
								obscureText: true,
							),
							SizedBox(height: 5.0),
							Container(
								alignment: Alignment(1.0, 0.0),
								padding: EdgeInsets.only(top: 15.0, left: 20.0),
								child: InkWell(
									child: Text(
										'Forgot Password',
										style: TextStyle(
											color: AppColor,
											fontWeight: FontWeight.bold,
											fontFamily: 'Montserrat',
											decoration: TextDecoration.underline),
									),
								),
							),
							SizedBox(height: 40.0),
							Container(
								height: 40.0,
								child: Material(
									borderRadius: BorderRadius.circular(20.0),
									shadowColor: Colors.deepPurpleAccent,
									color: AppColor,
									elevation: 7.0,
									child: GestureDetector(
										onTap: () {
											Navigator.of(context).pushNamed('/Register');
										},
										child: Center(
											child: Text(
												'LOGIN',
												style: TextStyle(
													color: Colors.white,
													fontWeight: FontWeight.bold,
													fontFamily: 'Montserrat'),
											),
										),
									),
								),
							),
							SizedBox(height: 20.0),
							Container(
								height: 40.0,
								color: Colors.transparent,
								child: Container(
									decoration: BoxDecoration(
										border: Border.all(
											color: Colors.black,
											style: BorderStyle.solid,
											width: 1.0),
										color: Colors.transparent,
										borderRadius: BorderRadius.circular(20.0)),
									child: Row(
										mainAxisAlignment: MainAxisAlignment.center,
										children: <Widget>[
											Center(
												child: Icon(Icons.perm_contact_calendar)
											),
											SizedBox(width: 10.0),
											Center(
												child: Text('Log in with Google',
													style: TextStyle(
														fontWeight: FontWeight.bold,
														fontFamily: 'Montserrat')),
											)
										],
									),
								),
							)
						],
					)),
				SizedBox(height: 15.0),
				Row(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
							'New to this app ?',
							style: TextStyle(fontFamily: 'Montserrat'),
						),
						SizedBox(width: 5.0),
						InkWell(
							onTap: () {
								Navigator.of(context).pushNamed('/signup');
							},
							child: Text(
								'Register',
								style: TextStyle(
									color: AppColor,
									fontFamily: 'Montserrat',
									fontWeight: FontWeight.bold,
									decoration: TextDecoration.underline),
							),
						)
					],
				)
			],
		));
  }
}




