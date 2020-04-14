import 'package:flutter/material.dart';

class Allfeed extends StatefulWidget {
  @override
  _AllfeedState createState() => _AllfeedState();
}

class _AllfeedState extends State<Allfeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
		child: Padding(
			padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
			child: Text(
				"Allfeed",
				style: TextStyle(
					fontSize: 70.0,
					fontWeight: FontWeight.w200
				),
			),
		)
	);
  }
}
