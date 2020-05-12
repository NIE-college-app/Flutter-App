import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:nie/Card.dart';
import 'package:nie/globalvariables.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getflutter/getflutter.dart';

import 'AboutPost.dart';

class Allfeed extends StatefulWidget {
  @override
  _AllfeedState createState() => _AllfeedState();
}

class _AllfeedState extends State<Allfeed> {

	final List<String> imageList = [
		"https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
		"https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
		"https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
		"https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
		"https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
		"https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
	];

	final Widget svg = SvgPicture.asset(
		svgName,
	);

	Map<String, String> data = {
		'Date' : '20-2-20',
		'link' : 'www.google.com',
		'title' : 'Today\'s event',
		'post' : 'lorem ipsummmmm',
		'photoUrl' : "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
	};

	@override
  Widget build(BuildContext context) {

    return LiquidPullToRefresh(
		onRefresh: () {},
		showChildOpacityTransition: false,
		child:SingleChildScrollView(
			child: Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Padding(
						padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							mainAxisAlignment: MainAxisAlignment.start,
							children: <Widget>[
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									mainAxisSize: MainAxisSize.max,
									children: <Widget>[
										Column(
											mainAxisAlignment: MainAxisAlignment.start,
											children: <Widget>[
												Text(
													"Feed",
													style: TextStyle(
														fontSize: 70.0,
														fontWeight: FontWeight.w100
													),
												),
												Padding(
													padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
													child: Text(
														"Last updated ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
														style: TextStyle(
															fontSize: 15.0,
															fontWeight: FontWeight.w200
														),
														textAlign: TextAlign.center,
													),
												),
											],
										),
										Column(
											mainAxisAlignment: MainAxisAlignment.start,
											children: <Widget>[
												Column(
													mainAxisAlignment: MainAxisAlignment.center,
													children: <Widget>[
														SizedBox(
															height: 60,
															width: 100,
															child: svg,
														),
														Text(temp)
													],
												)
											],
										)
									],
								),
								Padding(
									padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
									child: Column(
										children: <Widget>[
											Text("Events of the day"),
											GFCarousel(
												items: imageList.map(
														(url) {
														return GestureDetector(
															child: Container(
																margin: EdgeInsets.all(8.0),
																child: ClipRRect(
																	borderRadius: BorderRadius.all(Radius.circular(5.0)),
																	child: Image.network(
																		url,
																		fit: BoxFit.cover,
																		width: 1000.0
																	),
																),
															),
															onTap: () {
																Navigator.of(context).pushNamed(''
																	'/aboutPost',
																	arguments: PostData(
																		data
																	));
															},
														);
													},
												).toList(),
												onPageChanged: (index) {
													setState(() {
														index;
													});
												},
											),
										],
									)
								),
								FeedCard(),
								Divider(
									thickness: 1,
									height: 3,
								),
								FeedCard(),
								Divider(
									thickness: 1,
								),
								FeedCard(),
								Divider(
									thickness: 1,
								),
								FeedCard()
							],
						)
					),
				],
			)
		)
	);
  }
}
