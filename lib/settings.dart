import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nie/globalvariables.dart';



class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

	void changeColor(Color color) {
		setState(() => AppColor = color);
	}

	void appco(i) {
		setState(() {
		  AppColor = Appcolors[i];
		});
	}

	void accentco(i) {
		setState(() {
		  AccentColor = AccentColors[i];
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			iconTheme: IconThemeData(
				color: AccentColor
			),
			title: Text(
				title,
				style: TextStyle(
					color: AccentColor,
				),
			),
			backgroundColor: AppColor,
		),
		body: SingleChildScrollView(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisSize: MainAxisSize.max,
				children: <Widget>[
					Padding(
						padding: EdgeInsets.fromLTRB(10, 10, 10, 40),
						child: Text(
							"Settings",
							style: TextStyle(
								fontSize: 70.0,
								fontWeight: FontWeight.w200
							),
						),
					),
					Divider(),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						mainAxisSize: MainAxisSize.max,
						children: <Widget>[
							Padding(
								padding: EdgeInsets.all(4),
								child: Text(
									"DND",
									style: TextStyle(
										fontSize: 20,
										fontWeight: FontWeight.w600
									),
								),
							),
							CupertinoSwitch(
								value: dnd,
								onChanged: (bool value) {
									setState(() {
									  dnd = !dnd;
									});
								},
							)
						],
					),
					Divider(),
					Padding(
						padding: EdgeInsets.all(4),
						child: Text(
							"Select App Color",
							style: TextStyle(
								fontSize: 20,
							),
						),
					),
					Row(
						mainAxisSize: MainAxisSize.max,
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: Appcolors[0],
								),
								onPressed: () => appco(0),
							),
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: Appcolors[1],
								),
								onPressed: () => appco(1),
							),
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: Appcolors[2],
								),
								onPressed: () => appco(2),
							),
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: Appcolors[3],
								),
								onPressed: () => appco(3),
							),
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: Appcolors[4],
								),
								onPressed: () => appco(4),
							),
						],
					),
					Divider(),
					Padding(
						padding: EdgeInsets.all(4),
						child: Text(
							"Select Accent Color",
							style: TextStyle(
								fontSize: 20,
							),
						),
					),
					Row(
						mainAxisSize: MainAxisSize.max,
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: AccentColors[0],
								),
								onPressed: () => accentco(0),
							),
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: AccentColors[1],
								),
								onPressed: () => accentco(1),
							),
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: AccentColors[2],
								),
								onPressed: () => accentco(2),
							),
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: AccentColors[3],
								),
								onPressed: () => accentco(3),
							),
							IconButton(
								icon: Icon(
									CupertinoIcons.circle_filled,
									size: 40,
									color: AccentColors[4],
								),
								onPressed: () => accentco(4),
							),
						],
					)
				]
			),
		),
	);
  }
}
