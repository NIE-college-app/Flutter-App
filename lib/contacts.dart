import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/getflutter.dart';
import 'package:nie/AboutProf.dart';

import 'globalvariables.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About faculty"),
        elevation: 13,
        backgroundColor: AppColor,
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: faculty.map<ContactTile>((Map<String,Map<String,dynamic>> d){
              return ContactTile(d);
            }).toList()
          ),
        ),
      ),
    );
  }
}



class ContactTile extends StatefulWidget {
final Map<String,Map<String,String>> data;
ContactTile(this.data);

  @override
  _ContactTileState createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(
              context,
              '/aboutProf',
              arguments: ScreenArgs(
                  widget.data.keys.toList()[0],
                  widget.data.values.toList()[0],
              )
          );
        },
        child: GFListTile(
          avatar: GFAvatar(
            shape: GFAvatarShape.square,
            size: 50,
            backgroundImage: NetworkImage(widget.data.values.toList()[0]['image']),
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            widget.data.keys.toList()[0],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          subTitle: Text(
              widget.data.values.toList()[0]['About'],
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontStyle: FontStyle.italic
            ),
          ),
          icon: Icon(
            CupertinoIcons.forward,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
    );
  }
}
