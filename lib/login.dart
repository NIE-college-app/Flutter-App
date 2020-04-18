import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:nie/OldPosts.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/post.dart';
import 'Colfeed.dart';
import 'Allfeed.dart';
import 'options.dart';
import 'package:nie/Weather.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

	void nav(index) {
		setState(() {
			title = 'NIE';
			Getweather();
			if(index == 0) {
				body = Colfeed();
			}
			else if(index == 1) {
				body = Allfeed();
			}
			else if(index == 2) {
				body = Options();
			}
			else if(index == 3) {
				body = Post();
			}
			else if(index == 4){
				body = OldPosts();
				title = "Your old posts";
			}
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			title: Text(
				title,
				style: TextStyle(
					color: AccentColor,
				),
			),
			backgroundColor: AppColor,
			actions: <Widget>[
				Padding(
					padding: EdgeInsets.all(5),
					child: GestureDetector(
						child: CircleAvatar(
							backgroundColor: Colors.white,
							backgroundImage: AssetImage(
								"assets/images/logo.png",
							),
						),
						onTap: () =>  Navigator.pushNamed(context, '/settings'),
					)
				)
			],
		),
		body: body,
		bottomNavigationBar: CurvedNavigationBar(
			backgroundColor: Theme.of(context).iconTheme.color,
			color: AppColor,
			buttonBackgroundColor: AppColor,
			items: <Widget>[
				Icon(Icons.school, size: 30, color: AccentColor,),
				Icon(Icons.group, size: 30, color: AccentColor),
				Icon(Icons.line_style, size: 30, color: AccentColor),
				Icon(CupertinoIcons.pencil,size:30,color: AccentColor,),
				Icon(CupertinoIcons.profile_circled,size:30,color: AccentColor,)
			],
			onTap: (index) => nav(index),
			animationCurve: Curves.fastLinearToSlowEaseIn,
		),
	);
  }
}
