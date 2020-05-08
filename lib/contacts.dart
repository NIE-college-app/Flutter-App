import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getflutter/components/avatar/gf_avatar.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';
import 'package:getflutter/getflutter.dart';
import 'package:nie/AboutProf.dart';
import 'package:url_launcher/url_launcher.dart';

import 'globalvariables.dart';


TextEditingController controller = new TextEditingController();

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  bool search;

  bool searching;
  List<Map<String, Map<String,String>>> arr = [];

  @override
  void initState() {
    super.initState();
    searching = false;
    search = false;
  }

  void filtercontacts() {
    List<String> _cont = [];
    faculty.forEach((fax) {
      _cont.add(fax.keys.toList()[0]);
    });
    print(controller.text);
    if(controller.text.isNotEmpty) {
      arr=[];
      setState(() {
        _cont.removeWhere((te) {
          var j = controller.text.toLowerCase();
          return te.toLowerCase().contains(j);
        });
//        print(_cont);
        arr.addAll(faculty);
        _cont.forEach((con) {
//          print('------');
          arr.removeWhere((test) {
            return test.containsKey(con);
          });
        });

        searching = true;
//        print('----------------------------------------');
//        print(arr);
      });
    }
    else{
      setState(() {
        arr=faculty;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: search ? TextField(
          onChanged: (value) => filtercontacts(),
          toolbarOptions: ToolbarOptions(
            copy: true,
          ),
          controller: controller,
          decoration: InputDecoration(
            suffix: IconButton(
              icon: Icon(CupertinoIcons.clear),
              onPressed: () {
                setState(() {
                  search = false;
                });
              },
            ),
            labelStyle: TextStyle(
              color: Colors.white
            ),
            labelText: 'Search',
            prefixIcon: Icon(
                CupertinoIcons.search,
              color: Colors.white,
            )
          ),
        ) : Text('Faculty'),
        elevation: 0,
        backgroundColor: AppColor,
        actions: <Widget>[
          search ? Container() : IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () {
              setState(() {
                search = true;
              });
            },
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: searching ? arr.length != 0 ? arr.map<ContactTile>((Map<String,Map<String,dynamic>> d){
              return ContactTile(d);
            }).toList() : <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: SvgPicture.asset(
                        'assets/svg/notfound.svg',
                        height:  MediaQuery.of(context).size.height*0.3,
                        width:  MediaQuery.of(context).size.width,
                      ),
                    ),
                    Text(
                      "Not Found",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width*0.13,
                          fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
              )
            ] : faculty.map<ContactTile>((Map<String,Map<String,dynamic>> d){
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
    return GestureDetector(
      child: ListTile(
        title: Text(widget.data.keys.toList()[0]),
        subtitle: Text(widget.data.values.toList()[0]['num']),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.data.values.toList()[0]['image']),
        ),
      ),
      onTap: () {
          Navigator.pushNamed(
            context,
            '/aboutProf',
            arguments: ProfData(
            widget.data.keys.toList()[0],
            widget.data.values.toList()[0],
            )
          );
    },
    );
  }
}



//Card(
//elevation: 30,
//child: GestureDetector(
//onTap: (){
//Navigator.pushNamed(
//context,
//'/aboutProf',
//arguments: ProfData(
//widget.data.keys.toList()[0],
//widget.data.values.toList()[0],
//)
//);
//},
//child: GFListTile(
//avatar: GFAvatar(
//shape: GFAvatarShape.square,
//size: 50,
//backgroundImage: NetworkImage(widget.data.values.toList()[0]['image']),
//borderRadius: BorderRadius.circular(10),
//),
//title: Text(
//widget.data.keys.toList()[0],
//style: TextStyle(
//fontSize: 20,
//fontWeight: FontWeight.bold
//),
//),
//subTitle: Text(
//widget.data.values.toList()[0]['About'],
//softWrap: true,
//overflow: TextOverflow.ellipsis,
//maxLines: 1,
//style: TextStyle(
//fontStyle: FontStyle.italic
//),
//),
//icon: Icon(
//CupertinoIcons.forward,
//color: Colors.black,
//size: 30,
//),
//),
//),
//)