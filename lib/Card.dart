import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:nie/AboutPost.dart';
import 'package:nie/Allfeed.dart';

import 'globalvariables.dart';


class FeedCard extends StatefulWidget {
  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {

	Widget makeFeed({userName, userImage, feedTime, feedText, feedImage, comments}) {
		return Container(
			margin: EdgeInsets.only(bottom: 20),
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Row(
								children: <Widget>[
									Container(
										width: 50,
										height: 50,
										decoration: BoxDecoration(
											shape: BoxShape.circle,
											image: DecorationImage(
												image: NetworkImage(userImage),
												fit: BoxFit.cover
											)
										),
									),
									SizedBox(width: 10,),
									Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: <Widget>[
											Text(userName, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),),
											SizedBox(height: 3,),
											Text(feedTime, style: TextStyle(fontSize: 15, color: Colors.grey),),
										],
									)
								],
							),
							IconButton(
								icon: Icon(Icons.more_vert, size: 30, color: Colors.grey[600],),
								onPressed: () {},
							)
						],
					),
					SizedBox(height: 20,),
					Text(feedText, style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5, letterSpacing: .7),),
					SizedBox(height: 20,),
					feedImage != '' ?
					CupertinoContextMenu(
						child: Container(
							height: 200,
							decoration: BoxDecoration(
								borderRadius: BorderRadius.circular(10),
								image: DecorationImage(
									image: NetworkImage(feedImage),
									fit: BoxFit.cover
								)
							),
						),
						actions: <Widget>[
							CupertinoContextMenuAction(
								child: Row(
									children: <Widget>[
										Icon(CupertinoIcons.clock, color: Colors.black,),
										SizedBox(width: 10,),
										Text('Add remainder')
									],
									mainAxisAlignment: MainAxisAlignment.start,
								),
								onPressed: () {
									print('hello');
									Navigator.of(context).pop();
								},
							),
							CupertinoContextMenuAction(
								child: Row(
									mainAxisAlignment: MainAxisAlignment.start,
									children: <Widget>[
										Icon(CupertinoIcons.share, color: Colors.black,),
										SizedBox(width: 10,),
										Text('Share')
									],
								),
								onPressed: () {
									print('Share');
									Navigator.of(context).pop();
								},
							)
						],
					) : Container(),
					SizedBox(height: 20,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Row(
								children: <Widget>[
									makeLike(),
									SizedBox(width: 5,),
									Text("2.5K", style: TextStyle(fontSize: 15, color: Colors.grey[800]),)
								],
							),
							Text("400 Comments", style: TextStyle(fontSize: 13, color: Colors.grey[800]),)
						],
					),
					SizedBox(height: 20,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							makeLikeButton(isActive: true),
							makeCommentButton(),
							makeShareButton(),
						],
					),
					Divider(),
					_Comment(comments[0]['authorName'], comments[0]['authorImageUrl'], comments[0]['text'])
				],
			),
		);
	}


	Widget _Comment(String authorName, String authorImageUrl, String text) {
		return Padding(
			padding: EdgeInsets.all(0),
			child: ListTile(
				leading: Container(
					width: 50.0,
					height: 50.0,
					decoration: BoxDecoration(
						shape: BoxShape.circle,
					),
					child: CircleAvatar(
						child: ClipOval(
							child: Image(
								height: 50.0,
								width: 50.0,
								image: NetworkImage("https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
								fit: BoxFit.cover,
							),
						),
					),
				),
				title: Text(
					authorName,
					style: TextStyle(
						fontWeight: FontWeight.bold,
					),
				),
				subtitle: Text(text),
				trailing: FlatButton(
					padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
					child: Icon(CupertinoIcons.heart, color: Colors.pink,),
					shape: CircleBorder(),
					onPressed: () => print('Like comment'),
				),
			),
		);
	}

	Widget makeLike() {
		return Container(
			width: 25,
			height: 25,
			decoration: BoxDecoration(
				color: Colors.pink,
				shape: BoxShape.circle,
				border: Border.all(color: Colors.white)
			),
			child: Center(
				child: Icon(CupertinoIcons.heart_solid, size: 12, color: Colors.white),
			),
		);
	}



	Widget makeLikeButton({isActive}) {
		return FlatButton(
			child: Container(
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Icon(isActive ? CupertinoIcons.heart_solid : CupertinoIcons.heart, color: Colors.pink, size: 18,),
							SizedBox(width: 5,),
							Text("Like", style: TextStyle(color: isActive ? Colors.pink : Colors.grey),)
						],
					),
				),
			),
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(50),
			),
			onPressed: () {
				print('like');
			},
		);
	}

	Widget makeCommentButton() {
		return FlatButton(
			child: Container(
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Icon(CupertinoIcons.conversation_bubble, color: Colors.blue, size: 18),
							SizedBox(width: 5,),
							Text("Comment", style: TextStyle(color: Colors.grey),)
						],
					),
				),
			),
			onPressed: () {
				print('comment');
			},
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(50)
			),
		);
	}

	Widget makeShareButton() {
		return FlatButton(
			child: Container(
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Icon(Icons.short_text, color: Colors.grey, size: 18),
							SizedBox(width: 5,),
							Text("Read more..", style: TextStyle(color: Colors.grey),)
						],
					),
				),
			),
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(50),
			),
			onPressed: () {
				print('Read More');
			},
		);
	}

  @override
  Widget build(BuildContext context) {
    return makeFeed(
		userName: "Iresh Sharma",
		userImage: 'https://images.pexels.com/photos/2909067/pexels-photo-2909067.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
		feedTime: "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
		feedImage: 'https://images.pexels.com/photos/2909067/pexels-photo-2909067.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
		feedText: 'Hey hi this is the new design',
		comments: comments
	);
  }
}
