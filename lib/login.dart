import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:nie/OldPosts.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/loginPage.dart';
import 'package:nie/post.dart';
import 'package:nie/services/auth.dart';
import 'package:nie/services/loader.dart';
import 'Colfeed.dart';
import 'Allfeed.dart';
import 'options.dart';
import 'package:nie/Weather.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

	PageController _pageController;

	int _page = 0;

	@override
	void initState(){
		super.initState();
		_pageController = new PageController();
		Getweather();
//		storage.readAll().then((onValue){
//			data["email"] =  onValue['email'];
//			data["displayName"]= onValue['name'];
//			data["contact"]= onValue['num'];
//			data["USN"]= onValue['usn'];
//			data["Semester"]= onValue['sem'];
//			data["Section"]= onValue['section'];
//			data["photoUrl"]= onValue['pic'];
//			data["Branch"]= onValue['branch'];
//
//		});
	}

	void onPageChanged(int page) {
		setState(() {
			this._page = page;
		});
	}

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
				body = MyHomePage();
				title = "Group Profile";
			}
		});
		_pageController.animateToPage(
			index,
			duration: const Duration(milliseconds: 300),
			curve: Curves.ease
		);
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			elevation: 0,
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

		backgroundColor: Colors.white,
		drawer: ClipPath(
			clipper: _DrawerClipper(),
			child: Drawer(
				child: Padding(
					padding: EdgeInsets.only(left: 10),
					child: Column(
						mainAxisSize: MainAxisSize.max,
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Container(
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										SizedBox(height: 80,),
										CircleAvatar(
											radius: 60,
											backgroundImage: NetworkImage(data['photoUrl']),
										),
										SizedBox(height: 20,),
										Text(data['displayName'], style: TextStyle(
											fontWeight: FontWeight.w600,
											fontSize: 20
										),),
										SizedBox(height: 10,),
										Divider(
											thickness: 2,
										),
										SizedBox(height: 10,),
										DrawerItem(
											text: 'Notification',
											icon: Icon(CupertinoIcons.bell),
											onPressed: () {},
										),
										DrawerItem(
											text: 'Reminders',
											icon: Icon(CupertinoIcons.time),
											onPressed: () {},
										),
										DrawerItem(
											text: 'Developers',
											icon: Icon(Icons.computer),
											onPressed: () {},
										),
										Padding(
											padding: EdgeInsets.only(left: 40),
											child: DrawerItemSub(
												text: 'Iresh Sharma',
												onPressed: () {},
											),
										),
										Padding(
											padding: EdgeInsets.only(left: 40),
											child: DrawerItemSub(
												text: 'Pranav B',
												onPressed: () {},
											),
										),
									],
								),
							),
							Container(
								child: FlatButton(
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											RichText(
												text: TextSpan(
													children: [
														TextSpan(
															text: 'Not ${data['displayName']},\n',
															style: TextStyle(
																fontSize: 18,
																fontWeight: FontWeight.w500,
																color: Colors.black
															)
														),
														TextSpan(
															text: 'Sign Out',
															style: TextStyle(
																fontSize: 18,
																fontWeight: FontWeight.w500,
																color: Colors.blueAccent,
																decoration: TextDecoration.underline,
															)
														),
														TextSpan(
															text: ' ?',
															style: TextStyle(
																fontSize: 18,
																fontWeight: FontWeight.w500,
																color: Colors.blueAccent
															)
														),
													]
												),
											),
											SizedBox(height: 60,)
										],
									),
									onPressed: () {
										Navigator.of(context).pop();
										_openSignOutBottomSheet(context);
									},
								),
							)
						],
					),
				),
			),
		),
		body: PageView(
			controller: _pageController,
			children: <Widget>[
				Colfeed(),
				Allfeed(),
				Options(),
				Post(),
				MyHomePage()
			],
			onPageChanged: onPageChanged,
		),
		bottomNavigationBar: CurvedNavigationBar(
			backgroundColor: Theme.of(context).iconTheme.color,
			color: AppColor,
			buttonBackgroundColor: AppColor,
			items: <Widget>[
				Icon(Icons.school, size: 30, color: AccentColor,),
				Icon(Icons.group, size: 30, color: AccentColor),
				Icon(CupertinoIcons.profile_circled, size: 30, color: AccentColor),
				Icon(CupertinoIcons.pencil,size:30,color: AccentColor,),
				Icon(CupertinoIcons.group_solid,size:30,color: AccentColor,)
			],
			onTap: (index) => nav(index),
			animationCurve: Curves.fastLinearToSlowEaseIn,
			index: _page,
		),
	);
  }

  void _openSignOutBottomSheet(BuildContext context) {
		showModalBottomSheet(
			shape: BottomSheetShape(),
			backgroundColor: AppColor,
			context: context,
			builder: (_) {
				return Container(
					padding: EdgeInsets.only(top: 24,left: 49, right: 48),
					height: 200,
					child: Center(
						child: Column(
							mainAxisSize: MainAxisSize.max,
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
								Text(
									"${data['displayName']}, are you sure you want to sign out?",
									textAlign: TextAlign.center,
									style: TextStyle(
										color: Colors.white,
										fontSize: 20,
										fontWeight: FontWeight.w600,
									),
								),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									mainAxisSize: MainAxisSize.max,
									children: <Widget>[
										Expanded(
											child: ProgressButton(
												defaultWidget: Text(
													"Sign out",
													style: TextStyle(
														color: AppColor,
														fontSize: 16,
														fontWeight: FontWeight.w600,
													),
												),
												progressWidget: ColorLoader2(),
												color: Colors.white,
												onPressed: () async {
													await signOut();
													Future.delayed(Duration(milliseconds: 2000), () {
														Navigator.of(context).pushReplacement(
															new MaterialPageRoute(builder: (_) => loginPage())
														);
													});
												},
											)
										),
										SizedBox(
											width: 20,
										),
										Expanded(
											child: OutlineButton(
												onPressed: () {
													Navigator.of(context).pop();
												},
												borderSide: BorderSide(
													color: Theme.of(context).scaffoldBackgroundColor,
												),
												color: Theme.of(context).primaryColor,
												child: Text(
													"Stay logged in",
													style: TextStyle(
														color: Theme.of(context).scaffoldBackgroundColor,
														fontSize: 16,
														fontWeight: FontWeight.w600,
													),
												),
											),
										),
									],
								),

							],
						),
					),
				);
			}
		);
  }
}

class _DrawerClipper extends CustomClipper<Path> {
	@override
	Path getClip(Size size) {
		Path path = Path();

		path.moveTo(size.width - 50, 0);
		path.quadraticBezierTo(size.width, size.height / 2, size.width  - 50, size.height);
		path.lineTo(0, size.height);
		path.lineTo(0, 0);
		return path;
	}

	@override
	bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class DrawerItem extends StatelessWidget {

	final String text;
	final Function onPressed;
	final Icon icon;

  const DrawerItem({Key key, this.text, this.onPressed, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
		icon: icon,
		label: Text(
			text,
			style: TextStyle(
				fontWeight: FontWeight.w600,
				fontSize: 18
			),
		),
		onPressed: onPressed,
	);
  }
}

class DrawerItemSub extends StatelessWidget {

	final String text;
	final Function onPressed;

	const DrawerItemSub({Key key, this.text, this.onPressed}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return FlatButton(
			child: Text(
				text,
				style: TextStyle(
					fontWeight: FontWeight.w300,
					fontSize: 18
				),
			),
			onPressed: onPressed,
		);
	}
}




class BottomSheetShape extends ShapeBorder {
	@override
	// TODO: implement dimensions
	EdgeInsetsGeometry get dimensions => throw UnimplementedError();

	@override
	Path getInnerPath(Rect rect, {TextDirection textDirection}) {
		// TODO: implement getInnerPath
		throw UnimplementedError();
	}

	@override
	Path getOuterPath(Rect rect, {TextDirection textDirection}) {
		return getClip(rect.size);
	}

	@override
	void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
		// TODO: implement paint
	}

	@override
	ShapeBorder scale(double t) {
		// TODO: implement scale
		throw UnimplementedError();
	}

	Path getClip(Size size) {
		Path path = Path();

		path.moveTo(0, 40);
		path.quadraticBezierTo(size.width/2, 0, size.width, 40);
		path.lineTo(size.width, size.height);
		path.lineTo(0, size.height);

		return path;
	}

}
