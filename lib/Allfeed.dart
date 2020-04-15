import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nie/Card.dart';

class Allfeed extends StatefulWidget {
  @override
  _AllfeedState createState() => _AllfeedState();
}

class _AllfeedState extends State<Allfeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
		child: Column(
			mainAxisSize: MainAxisSize.max,
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
			children: <Widget>[
				Padding(
					padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						mainAxisAlignment: MainAxisAlignment.start,
						children: <Widget>[
							Text(
								"Feed",
								style: TextStyle(
									fontSize: 70.0,
									fontWeight: FontWeight.w200
								),
							),
							Text(
								"Last updated 00:00:00",
								style: TextStyle(
									fontSize: 15.0,
									fontWeight: FontWeight.w200
								),
								textAlign: TextAlign.center,
							),
							FeedCard(),
						],
					)
				),
			],
		)
	);
  }
}
