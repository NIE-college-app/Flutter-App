import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:nie/OldPosts.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/post.dart';
import 'package:nie/services/auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Colfeed.dart';
import 'Allfeed.dart';
import 'options.dart';
import 'package:nie/Weather.dart';
import 'package:getflutter/getflutter.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

	bool oldPostsPage=false;

	void nav(index) {
		setState(() {
			title = 'NIE';
			oldPostsPage = false;
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
				oldPostsPage = true;
				title = "Your posts";
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
					child: CircleAvatar(
						backgroundColor: Colors.white,
						backgroundImage: NetworkImage(
							data['photoUrl']
						)
					),
				)
			],
		),

		backgroundColor: oldPostsPage?Colors.black:Colors.white,
		drawer:
		GFDrawer(
			child: ListView(
				padding: EdgeInsets.zero,
				children: <Widget>[
					GFDrawerHeader(
						child: Row(
							mainAxisAlignment: MainAxisAlignment.start,
							crossAxisAlignment: CrossAxisAlignment.center,
							children: <Widget>[
								GFAvatar(
									radius: 50.0,
									backgroundImage: NetworkImage(data['photoUrl']),
								),
								Padding(
									padding: EdgeInsets.all(5),
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											Text(
												data['displayName'],
												textAlign: TextAlign.left,
											),
											Text(
												data['email'],
												textAlign: TextAlign.left,
											),
										],
									),
								)
							],
						),
					),
					Column(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Container(
								height: MediaQuery.of(context).size.height*0.6,
								child: Column(
									children: <Widget>[
										Padding(
											padding: EdgeInsets.all(5),
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													Text('DND'),
													CupertinoSwitch(
														value: dnd,
														onChanged: (value) {
															setState(() {
																dnd = value;
															});
														},
													)
												],
											),
										),
										Divider(),
										CupertinoButton(
											child: Row(
												mainAxisSize: MainAxisSize.max,
												mainAxisAlignment: MainAxisAlignment.start,
												children: <Widget>[
													Padding(
														padding: EdgeInsets.all(5),
														child: Icon(
															CupertinoIcons.bell,
															color: Colors.grey[900],
														),
													),
													Text(
														'Notifications',
														style: TextStyle(
															color: Colors.grey[900]
														),
													)
												],
											),
											onPressed: () => print('pressed'),
										)
									],
								),
							),
							Container(
								child: Align(
									alignment: FractionalOffset.bottomCenter,
									child: Column(
										children: <Widget>[
											SignInButton(
												Buttons.Email,
												text: 'Logout',
												onPressed: () => signOut(),
											),
											Text('Follow Developers on insta'),
											Row(
												mainAxisAlignment: MainAxisAlignment.spaceEvenly,
												children: <Widget>[
													CupertinoButton(
														child: Text('@iresharma.py'),
														onPressed: () => launch('https://www.instagram.com/iresharma.py/'),
													),
													CupertinoButton(
														child: Text('@blaze_2305'),
														onPressed: () => launch('https://www.instagram.com/blaze_2305/'),
													)
												],
											)
										],
									),
								),
							)
						],
					)
				],
			),
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
