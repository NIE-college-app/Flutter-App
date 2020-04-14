import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nie/globalvariables.dart';
import 'Colfeed.dart';
import 'Allfeed.dart';
import 'options.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

	void nav(index) {
		setState(() {
			if(index == 0) {
				body = Allfeed();
			}
			else if(index == 1) {
				body = Colfeed();
			}
			else if(index == 2) {
				body = Options();
			}
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			title: Text(title),
			backgroundColor: AppColor,
			actions: <Widget>[
				Padding(
					padding: EdgeInsets.all(5),
					child: CircleAvatar(
						backgroundImage: AssetImage(
							"assets/NIE-Mysore-Logo.png"
						),
						foregroundColor: Colors.red,
					),
				)
			],
		),
		body: body,
		bottomNavigationBar: CurvedNavigationBar(
			backgroundColor: Colors.white,
			color: AppColor,
			buttonBackgroundColor: AppColor,
			items: <Widget>[
				Icon(Icons.school, size: 30, color: Colors.white,),
				Icon(Icons.group, size: 30, color: Colors.white,),
				Icon(Icons.line_style, size: 30, color: Colors.white,),
			],
			onTap: (index) => nav(index),
		),
	);
  }
}
