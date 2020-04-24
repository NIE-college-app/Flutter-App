import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {

	VideoPlayerController _controller;
	Future<void> _initialVideoPlayerFuture;

	@override
  void initState() {
	_controller = VideoPlayerController.asset(
		'assets/video/asset.mp4'
	);

	_initialVideoPlayerFuture = _controller.initialize();
	_controller.setLooping(true);
	_controller.setVolume(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
		padding: EdgeInsets.all(10),
		child: Card(
			shape: RoundedRectangleBorder(
				borderRadius: BorderRadius.circular(20)
			),
			elevation: 5,
			child: Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
				children: <Widget>[
					Padding(
						padding: EdgeInsets.all(0),
						child: GestureDetector(
							child: FutureBuilder(
								future: _initialVideoPlayerFuture,
								builder: (context, snapshot) {
									if (snapshot.connectionState == ConnectionState.done) {
										return AspectRatio(
											aspectRatio: _controller.value.aspectRatio,
											child: VideoPlayer(_controller),
										);
									}
									else {
										return Center(
											child: CircularProgressIndicator(),
										);
									}
								},
							),
							onTap: () {
								setState(() {
								  if(_controller.value.isPlaying){
								  	_controller.pause();
								  }
								  else {
								  	_controller.play();
								  }
								});
							},
						)
					),
					Padding(
						padding: EdgeInsets.all(20),
						child: Column(
							children: <Widget>[
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										Row(
											children: <Widget>[
												GFAvatar(
													backgroundImage: AssetImage("assets/images/logo.png"),
													backgroundColor: Colors.white,
												),
												Text("Card Title")
											],
										),
										OutlineButton.icon(
											onPressed: () {

											},
											icon: Icon(CupertinoIcons.heart),
											label: Text('Like')
										)
									],
								),
								Padding(
									padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
									child: Text("Some example text for the video card"),
								),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									mainAxisSize: MainAxisSize.max,
									children: <Widget>[
										OutlineButton.icon(
											onPressed: () {

											},
											icon: Icon(CupertinoIcons.conversation_bubble),
											label: Text('Dicuss')
										),
										FlatButton(
											child: Text('Read more'),
											onPressed: () {

											},
										)
									],
								)
							],
						),
					)
				],
			),
		),
	);
  }
}
