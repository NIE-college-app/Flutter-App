import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Container(
		child: Padding(
			padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
			child: Text(
				"Options",
				style: TextStyle(
					fontSize: 70.0,
					fontWeight: FontWeight.w200
				),
			),
		)
	);
  }
}
