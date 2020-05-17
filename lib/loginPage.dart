import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/main.dart';
import 'package:nie/services/auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:nie/login.dart';
import 'package:http/http.dart' as http;
import 'package:nie/services/loader.dart';


class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

	bool active;

	Map<String,dynamic> userData={};
	final _formKey = GlobalKey<FormState>();

	@override
  void initState() {
    super.initState();
    setState(() {
    	active = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
		resizeToAvoidBottomPadding: false,
		body: Builder(
			builder: (context)=>
					Column(
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
									child: Form(
										key: _formKey,
										child: Column(
											children: <Widget>[
												TextFormField(
													decoration: InputDecoration(
															labelText: 'EMAIL',
															labelStyle: TextStyle(
																	fontFamily: 'Montserrat',
																	fontWeight: FontWeight.bold,
																	color: Colors.grey),
															focusedBorder: UnderlineInputBorder(
																	borderSide: BorderSide(color: AppColor))),
													validator: (String value){
														String regex="^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";
														if(value.isEmpty){
															return "Enter your email";
														}else if(RegExp(regex).hasMatch(value)){
															setState(() {
																userData['email']=value.trim();
															});
															return null;
														}else{
															return 'Please Enter a valid Email';
														}
													},
												),
												SizedBox(height: 20.0),
												TextFormField(
													decoration: InputDecoration(
															labelText: 'PASSWORD',
															labelStyle: TextStyle(
																	fontFamily: 'Montserrat',
																	fontWeight: FontWeight.bold,
																	color: Colors.grey),
															focusedBorder: UnderlineInputBorder(
																	borderSide: BorderSide(color: AppColor))),
													obscureText: true,
													validator: (String value){
														if(value.isEmpty){
															return "Enter your password";
														}else{
															setState(() {
																userData['password']=value.trim();
															});
															return null;
														}
													},
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
												ProgressButton(
													defaultWidget: Center(
														child: Text(
															'LOGIN',
															style: TextStyle(
																	color: Colors.white,
																	fontWeight: FontWeight.bold,
																	fontFamily: 'Montserrat'),
														),
													),
													color: active ? Colors.white : AppColor,
													borderRadius: 50,
													progressWidget: ColorLoader2(),
													width: MediaQuery.of(context).size.width,
													onPressed: () async {
														setState(() {
															active = true;
														});
														var loggedIn = await login();
														if(loggedIn) {
															await storage.write(key: 'logged', value: 'true');
															Future.delayed(Duration(seconds: 3), () {
																setState(() {
																	active = false;
																});
																Navigator.pushReplacement(
																		context,
																		new MaterialPageRoute(
																				builder: (BuildContext context) => Login())
																);
															});
														}
														else{
															setState(() {
																active = false;
															});
															Scaffold.of(context).showSnackBar(SnackBar(
																content: Text("Please check Email/Password"),
																elevation: 20,
															));
														}
													},
												),
												SizedBox(height: 20.0),
												ProgressButton(
														defaultWidget: Container(
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
														),
														progressWidget: ColorLoader2(),
														width: MediaQuery.of(context).size.width,
														borderRadius: 50,
														onPressed: () async {
															await handleSignIn();
															Navigator.of(context).pushNamed('/Register');
														},
														color: Colors.white
												)
											],
										),
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
											Navigator.of(context).pushNamed('/Register');
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
					),
		));
  }

  Future<bool> login()async{
		if(_formKey.currentState.validate()){
			print("valid");
			print(userData);
			Map<String,dynamic> user = await sendLoginData(userData);
			print(user);
			if(user['status']){
				print("YES");
				return true;
			}else{
				print("NO");
				return false;
			}
		}
	}


	Future<Map<String,dynamic>> sendLoginData(Map<String,dynamic> indata) async {
		print(data);
		final http.Response response = await http.post(
			'http://10.0.2.2:5000/api/login',
			headers: <String, String>{
				'Content-Type': 'application/json; charset=UTF-8',
			},
			body: jsonEncode(indata),
		);
		var _data = json.decode(response.body);
		print(_data);
		if(_data['status']==true){
			final http.Response useResp = await http.get(
				'http://10.0.2.2:5000/api/users/'+_data['uid'],
				headers: <String, String>{
					'Content-Type': 'application/json; charset=UTF-8',
				},
			);
			Map<String,dynamic> _userData = json.decode(useResp.body);
			if(_userData['status']==true){
				print(_userData);
				setState(() {
				  data = _userData['data'];
				  print('glob data $data');
				  if(!data.containsKey('photoUrl')){
				  	data['photoUrl']='https://cdn.dribbble.com/users/1744884/screenshots/3883904/wolf_head_logo.jpg';
					}
				});
				return {
					'status':true
				};
			}else{
				print("Try again");
				return {
					'status':false
				};
			}
		}else{
			print("Try again");
			return {
				'status':false
			};
		}
	}
}

