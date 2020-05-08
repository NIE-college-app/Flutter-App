import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/getflutter.dart';
import 'package:nie/AboutPost.dart';
import 'package:nie/globalvariables.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final String url = 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/09/04/15/lionel-messi-0.jpg?';
  ScrollController _controller = ScrollController();

  final Widget likes = SvgPicture.asset(
    'assets/svg/icons8-love.svg',
  );

  final Widget members = SvgPicture.asset(
    'assets/svg/icons8-people.svg',
  );

  final Widget events = SvgPicture.asset(
    'assets/svg/icons8-event_accepted.svg',
  );

  final Widget post = SvgPicture.asset(
	  'assets/svg/icons8-easel.svg',
  );


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        elevation: 0,
        backgroundColor: AppColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.35,
              decoration: BoxDecoration(
                color: AppColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32)
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          children: <Widget>[
                            likes,
                            Text(
                                'Likes',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            Text(
                                '12',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(url)
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          children: <Widget>[
                            members,
                            Text('Members',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            Text('18',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: Text('Herman Jimenez',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            events,
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                '12',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            Text(
                              'Events',
                              style: TextStyle(
                                fontSize: 20,
                                  color: Colors.white
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            post,
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(
                                '12',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            Text(
                              'Posts',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            )
                          ],
                        )
                      ]
                    ),
                  )
                ],
              ),
            ),
           Container(
             padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
             height: MediaQuery.of(context).size.height*0.7,
             child:  GridView.count(
               crossAxisCount: 3,
               crossAxisSpacing: 5,
               mainAxisSpacing: 5,
               children: List.generate(30, (index) {
                 return Center(
                   child: Stack(
                     fit: StackFit.expand,
                     children: <Widget>[
                       Image(
                         image: NetworkImage(url),
                         fit: BoxFit.fill,
                       ),
                     ],
                   )
                 );
               }),
             ),
           )
          ],
        ),
      )
    );
  }
}