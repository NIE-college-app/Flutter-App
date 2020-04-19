import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/getflutter.dart';
import 'package:nie/AboutPost.dart';
import 'package:nie/globalvariables.dart';

class OldPosts extends StatefulWidget {
  @override
  _OldPostsState createState() => _OldPostsState();
}

class _OldPostsState extends State<OldPosts> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){},
      displacement: 30,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GFImageOverlay(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              image: AssetImage('assets/images/background.jfif'),
              child: FractionallySizedBox(
                widthFactor: 0.7,
                heightFactor: 0.7,
                child: GFAvatar(
                    backgroundImage: NetworkImage(data['photoUrl'])
                ),
              ),
              boxFit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                elevation: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.heart_solid,
                              color: Colors.pink,
                              size: 40,
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                fontSize: 25
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.person_solid,
                              color: Colors.pink,
                              size: 40,
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 25
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: Colors.pink,
                              size: 40,
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 25
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Column(
                children: <Widget>[
                  Center(
                    child:GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(2),
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3,
                      crossAxisCount: 3,

                      children: oldPostData.map<GestureDetector>((Map<String,String> data){
                        return  GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(
                                context,
                                '/aboutPost',
                                arguments: PostData(
                                    data
                                )
                            );
                          },
                          child: Card(
                            child: Container(
                                padding: EdgeInsets.all(0),
                                child: Image(
                                  image: NetworkImage(data['photoUrl']),
                                  fit: BoxFit.fill,
                                ), 
                            ),
                          ),
                        );
                      }).toList(),

                    ),
                  ),
                ],
              ),
          ],
        ),
      )
    );
  }
}
