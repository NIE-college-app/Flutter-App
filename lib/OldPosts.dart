import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getflutter/components/image/gf_image_overlay.dart';
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
      child: Center(
        child:GridView.count(
          primary: false,
          padding: const EdgeInsets.all(2),
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
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
  		    child: Container(
            padding: EdgeInsets.all(0),
            child: Image(
              image: NetworkImage(data['photoUrl']),
              fit: BoxFit.fill,
            )
          ),
  		  );
        }).toList(),

        ),
      ),
    );
  }
}
