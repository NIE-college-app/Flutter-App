import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/getflutter.dart';
import 'package:nie/globalvariables.dart';
import 'package:url_launcher/url_launcher.dart';


class ScreenArgs{
  final String name;
  final Map<String,String> data;
  ScreenArgs(this.name,this.data);
}


class AboutProf extends StatelessWidget {


  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void copyToClipBoard(String data) {
    Clipboard.setData(
        ClipboardData(
            text: data
        )
    );

  }

  @override
  Widget build(BuildContext context) {

    final ScreenArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
          ),
        ),
        backgroundColor: AppColor,
      ),


      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[GFImageOverlay(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage('assets/images/background.jfif'),
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      heightFactor: 0.7,
                      child: GFAvatar(
                          backgroundImage: NetworkImage(args.data['image'])
                        ),
                    ),
                    boxFit: BoxFit.fill,
                  ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          args.data['num'],
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width*0.045
                          ),
                        ),
                      ),
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: (){
                                  _launchURL('tel:'+args.data['num']);
                                },
                                icon: Icon(
                                    Icons.phone,
                                  color: Colors.green,
                                ),
                                color: Colors.green,
                              ),
                              IconButton(
                                onPressed: (){
                                  _launchURL('sms:'+args.data['num']);
                                },
                                icon: Icon(
                                  Icons.message,
                                  color: Colors.green,
                                ),
                                color: Colors.green,
                              ),
                              IconButton(
                                onPressed: (){
                                  copyToClipBoard(args.data['num']);
                                },

                                icon: Icon(
                                  Icons.content_copy,
                                  color: Colors.blue,
                                ),
                                color: Colors.blue,
                              ),
                            ],
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            args.data['email'],
                            style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.045,
                            ),
                            overflow: TextOverflow.clip,
                            softWrap: true,
                          ),
                        ),
                      ),
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: (){
                                _launchURL('mailto:'+args.data['email']);
                              },
                              icon: Icon(
                                Icons.email,
                                color: Colors.green,
                              ),
                              color: Colors.green,
                            ),
                            IconButton(
                              onPressed: (){
                                copyToClipBoard(args.data['email']);
                              },
                              icon: Icon(
                                Icons.content_copy,
                                color: Colors.blue,
                              ),
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "About: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:20,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.double
                          )
                        ),
                      ),

                      Flexible(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 13,
                            ),
                            child: Text(
                              args.data["About"],
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic,
                                wordSpacing: 1,

                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),


            ],
          ),
        ),
      )
    );
  }

  

}
