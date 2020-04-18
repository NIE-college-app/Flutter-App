import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/getflutter.dart';
import 'package:nie/globalvariables.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

class PostData{
  final Map<String,String> data;
  PostData(this.data);
}

class AboutPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PostData args = ModalRoute.of(context).settings.arguments;

    _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    void copyToClipBoard(BuildContext _context,String data) {
      Clipboard.setData(
          ClipboardData(
              text: data
          )
      );
      Scaffold.of(_context).showSnackBar(SnackBar(
        content: Text(
          "Copied to Clipboard!"
        ),
        elevation: 20,
      ));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Old Posts"
          ),
          backgroundColor: AppColor,
        ),

//     title':"This is an interesting title indeed",
//		'post':"This is an interesting event indeed , very useful :3.Now I'll add some long text to fill the space Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//		'link':"www.example.com",
//		"event":'true',
//		'photoUrl':'https://picsum.photos/200',
//		'Audience':'one',
//		'Date':'2020-04-03',
//		'Time':'03:08:00.000

      body:Builder(
        builder: (BuildContext context){
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    child: ClipRect(
                      child: PhotoView(
                        imageProvider: NetworkImage(args.data['photoUrl']),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        args.data['title'],
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      args.data['post'],
                      style: TextStyle(
                          fontSize: 19,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),

                  args.data.containsKey('link')?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Register at:",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _launchURL('http://' + args.data['link']);
                                    },
                                    child: Text(
                                      args.data['link'],
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontStyle: FontStyle.italic
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: IconButton(
                          onPressed:()=>copyToClipBoard(context,args.data['link']),
                          icon: Icon(
                            Icons.content_copy,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      )
                    ],
                  ):
                  Text(""),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      args.data['Date'],
                      style: TextStyle(
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      )

    );
  }


}
