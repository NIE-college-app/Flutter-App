import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

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
								"Allfeed",
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
				Padding(
					padding: EdgeInsets.all(0),
					child: GFCard(
						boxFit: BoxFit.cover,
						image: Image.asset('your asset image'),
						title: GFListTile(
							avatar:GFAvatar(),
							title: Text('Card Title'),
							icon: OutlineButton.icon(onPressed: () => print('liked'),
								icon: Icon(CupertinoIcons.heart),
								label: Text("Like")
							)
						),
						content:Text( "Some quick example text to build on the card"),
						buttonBar: GFButtonBar(
							children: <Widget>[
								FlatButton(
									onPressed: () {},
									child: Text('Read More'),
								),
							],
						),
						elevation: 5,
					),
				)

			],
		)
	);
  }
}
