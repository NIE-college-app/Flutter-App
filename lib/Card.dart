import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter/cupertino.dart';

class FeedCard extends StatefulWidget {
  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
		padding: EdgeInsets.all(0),
		child: GFCard(
			boxFit: BoxFit.cover,
			image: Image.asset('assets/images/logo.png'),
			title: GFListTile(
				avatar:GFAvatar(
					backgroundImage: AssetImage('assets/images/logo.png',),
					backgroundColor: Colors.white,
				),
				title: Text('Card Title'),
				icon: OutlineButton.icon(onPressed: () => print('liked'),
					icon: Icon(CupertinoIcons.heart),
					label: Text("Like")
				)
			),
			content:Text( "Some quick example text to build on the card"),
			buttonBar: GFButtonBar(
				children: <Widget>[
					Padding(
						padding: EdgeInsets.all(2),
						child: Row(
							mainAxisSize: MainAxisSize.max,
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: <Widget>[
								OutlineButton.icon(
									onPressed: () {},
									icon: Icon(CupertinoIcons.conversation_bubble),
									label: Text("Discuss")
								),
								FlatButton(
									onPressed: () {},
									child: Text('Read More'),
								)
							],
						),
					)
				],
			),
			elevation: 5,
		),
	);
  }
}
