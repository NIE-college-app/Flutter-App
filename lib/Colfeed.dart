import 'package:flutter/material.dart';
import 'package:nie/Card.dart';
import 'package:nie/globalvariables.dart';

class Colfeed extends StatefulWidget {
  @override
  _ColfeedState createState() => _ColfeedState();
}

class _ColfeedState extends State<Colfeed> {

  @override
  Widget build(BuildContext context) {
    return Column(
		crossAxisAlignment: CrossAxisAlignment.start,
		children: <Widget>[
			Padding(
				padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisAlignment: MainAxisAlignment.start,
					children: <Widget>[
						Text(
							"Colfeed",
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
					],
				)
			),
			FeedCard(),
		],
	);
  }
}
