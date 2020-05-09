import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'globalvariables.dart';


class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
		appBar: AppBar(
			elevation: 0,
			 backgroundColor: Colors.white,
			leading: IconButton(
				icon: Icon(CupertinoIcons.back, color: Colors.black,),
				onPressed: () => Navigator.of(context).pop(),
			),
			actions: <Widget>[
				Container(
					margin: EdgeInsets.all(10),
					child: CircleAvatar(
						backgroundImage: NetworkImage(
							data['photoUrl']
						),
					),
				),
			],
		),
		body: SingleChildScrollView(
			child: Column(
				mainAxisSize: MainAxisSize.max,
				mainAxisAlignment: MainAxisAlignment.start,
				crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
					Container(
						margin: EdgeInsets.only(top: 80, left: 40 , right: 10),
						child: Text(
							'Iresh',
							style: TextStyle(
								fontSize: 30,
								fontWeight: FontWeight.bold
							),
						),
					),
					Container(
						margin: EdgeInsets.only(left: 40, right: 10),
						child: Row(
							mainAxisSize: MainAxisSize.max,
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: <Widget>[
								Text('Various posts till date'),
								Text('Last updated ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}')
							],
						),
					),
					SizedBox(height: 15,),
					Center(
						child: Container(
							width: MediaQuery.of(context).size.width*0.9,
							child: Divider(
								thickness: 1,
							),
						),
					),
					SizedBox(height: 15,),
					Container(
						height: MediaQuery.of(context).size.height,
						child: GridView.count(
							crossAxisCount: 2,
							primary: false,
							mainAxisSpacing: 10,
							crossAxisSpacing: 10,
							childAspectRatio: 2,
							children: <Widget>[
								Container(
									child: Image.network("https://images.pexels.com/photos/2909067/pexels-photo-2909067.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
										fit: BoxFit.fill
									),
								)
							],
						),
					)
				],
			),
		)
	);
  }
}
