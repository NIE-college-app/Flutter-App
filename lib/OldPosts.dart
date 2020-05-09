import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.network("https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/0002/5765/brand.gif?itok=QnjrIwDx", fit: BoxFit.contain,),
          ),

          DraggableScrollableSheet(
            minChildSize: 0.1,
            initialChildSize: 0.24,
            builder: (context, scrollController){
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //for user profile header
                      Container(
                        padding : EdgeInsets.only(left: 32, right: 32, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipOval(
                                  child: Image.network("https://img.evaluationengineering.com/files/base/ebm/ee/image/2018/11/IEEE-Logo-Tagline-300x168.png?auto=format&dpr=2&w=720", fit: BoxFit.cover,),
                                )
                            ),

                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("NISB", style: TextStyle(color: Colors.grey[800], fontFamily: "Roboto",
                                      fontSize: 36, fontWeight: FontWeight.w700
                                  ),),
                                  Text("NIE IEEE Student Branch", style: TextStyle(color: Colors.grey[500], fontFamily: "Roboto",
                                      fontSize: 16, fontWeight: FontWeight.w400
                                  ),),
                                ],
                              ),
                            ),
                            GestureDetector(
                                child: Icon(Icons.sms, color: Colors.blue, size: 40,),
                              onTap: () => launch('sms:858287144'),
                            )
                          ],
                        ),
                      ),

                      //performace bar

                      SizedBox(height: 16,),
                      Container(
                        padding: EdgeInsets.all(32),
                        color: Colors.blueAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            GestureDetector(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.card_membership, color: Colors.white, size: 30,),
                                      SizedBox(width: 4,),
                                      Text("234", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                                          fontFamily: "Roboto", fontSize: 24
                                      ),)
                                    ],
                                  ),
                                  Text("Posts", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
                                      fontFamily: "Roboto", fontSize: 20
                                  ),)
                                ],
                              ),
                              onTap: () => Navigator.of(context).pushNamed('/posts'),
                            ),

                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.favorite, color: Colors.white, size: 30,),
                                    SizedBox(width: 4,),
                                    Text("400", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto", fontSize: 24
                                    ),)
                                  ],
                                ),

                                Text("Likes", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto", fontSize: 20
                                ),)
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.event_seat, color: Colors.white, size: 30,),
                                    SizedBox(width: 4,),
                                    Text("5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                                        fontFamily: "Roboto", fontSize: 24
                                    ),)
                                  ],
                                ),

                                Text("Events", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto", fontSize: 20
                                ),)
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16,),
                      //container for about me

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text("About Me", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w700,
                                fontFamily: "Roboto", fontSize: 18
                            ),),

                            SizedBox(height: 8,),
                            Text("Hello, this is maaz, and I am from easy approach, and this is just a demo text for information about me"
                                "Hello, this is maaz, and I am from easy approach, and this is just a demo text for information about me",
                              style: TextStyle(fontFamily: "Roboto", fontSize: 15),
                              textAlign: TextAlign.center,
                            ),

                          ],
                        ),
                      ),

                      SizedBox(height: 16,),
                      //Container for clients

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text("Office Bearers", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.w700,
                                fontFamily: "Roboto", fontSize: 18
                            ),),

                            SizedBox(height: 8,),
                            //for list of clients
                            Container(
                              width: MediaQuery.of(context).size.width-64,
                              height: 80,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Tooltip(
                                    message: 'Name \nOffice',
                                    child: Container(
                                      width: 80,
                                      height: 80,
                                      margin: EdgeInsets.only(right: 8),
                                      child: ClipOval(child: Image.network("https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg", fit: BoxFit.cover,),),
                                    ),
                                    waitDuration: Duration(milliseconds: 100),
                                    margin: EdgeInsets.all(0),
                                  );
                                },
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                              ),
                            )

                          ],
                        ),
                      ),

                      SizedBox(height: 16,),

                      //Container for reviews

                      Container(
                        padding: EdgeInsets.only(left: 32, right: 32),
                        child: Column(
                          children: <Widget>[
                            Text("Info", style: TextStyle(color: Colors.grey[800], fontSize: 18, fontFamily: "Roboto",
                                fontWeight: FontWeight.w700
                            ),),


                            Container(),
                            SizedBox(height: 80,),
                            Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CupertinoButton(
                                      child: SvgPicture.asset('assets/svg/icons8-facebook_f.svg', height: 40, width: 40,),
                                      onPressed: () {
                                        launch("https://www.facebook.com/iresharma");
                                      },
                                    ),
                                    CupertinoButton(
                                      child: SvgPicture.asset('assets/svg/insta.svg', height: 40, width: 40,),
                                      onPressed: () {
                                        launch("https://www.instagram.com/iresharma.py");
                                      },
                                    ),

                                    CupertinoButton(
                                      child: SvgPicture.asset('assets/svg/icons8-linkedin.svg', height: 40, width: 40,),
                                      onPressed: () {
                                        launch("https://www.facebook.com/iresharma");
                                      },
                                    ),
                                    CupertinoButton(

                                      child: SvgPicture.asset('assets/svg/icons8-responsive.svg', height: 40, width: 40,),
                                      onPressed: () {
                                        launch("https://www.instagram.com/iresharma.py");
                                      },
                                    )
                                  ],
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),

                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),

                ),
              );
            },
          )
        ],
      ),
    );
  }
}
