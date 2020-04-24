import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nie/Card.dart';
import 'package:nie/globalvariables.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nie/videoCard.dart';

class Colfeed extends StatefulWidget {
  @override
  _ColfeedState createState() => _ColfeedState();
}

class _ColfeedState extends State<Colfeed> {

	ScrollController controller = new ScrollController();

  @override
  Widget build(BuildContext context) {

	  final Widget svg = SvgPicture.asset(
		  svgName,
	  );

    return RefreshIndicator(
		displacement: 30.0,
		onRefresh: (){},
		child:SingleChildScrollView(
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
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									mainAxisSize: MainAxisSize.max,
									children: <Widget>[
										Column(
											mainAxisAlignment: MainAxisAlignment.start,
											children: <Widget>[
												Text(
													"College",
													style: TextStyle(
														fontSize: 70.0,
														fontWeight: FontWeight.w200
													),
												),
												Text(
													"Last updated ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
													style: TextStyle(
														fontSize: 15.0,
														fontWeight: FontWeight.w200
													),
													textAlign: TextAlign.center,
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

								VideoCard(),
								FeedCard(),
								FeedCard(),
								FeedCard(),
								FeedCard(),
							],
						)
					),
				],
			)
		)
	);
  }
}
