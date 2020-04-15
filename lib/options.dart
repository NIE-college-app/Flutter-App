import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'globalvariables.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 40,
              margin: EdgeInsets.all(6),
              color: AccentColor,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
              child: Column(
                children: <Widget>[
                  GFAccordion(
                    titleChild: Container(
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 5.0
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(1000))
                          ),
                                child: GFAvatar(
                                  backgroundImage: NetworkImage(data['photoUrl']),
                                  radius: 70,
                                ),
                              ),
                            ],
                          )
                      ),
                    contentChild: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _Row("Name: "," ${data['displayName']}"),
                          _Row("USN: "," ${data['USN']}"),
                          _Row("Contact: "," ${data['contact']}"),
                          _Row("Email: "," ${data['email']}"),
                          _Row("Department: "," ${data['Branch']}"),
                          _Row("Semester: "," ${data['Semester']}"),
                          _Row("Section: "," ${data['Section']}"),
//                              Text(
//                                "Following: ",
//                                style: _field_style,
//                              ),
//                              Text(
//                                ' '*10+"- ${data['Groups'].join('\n'+' '*10+'- ')}",
//                                style: _value_style,
//                              )
                        ],
                      ),
                    ),
                    collapsedIcon: Icon(
                        CupertinoIcons.down_arrow,
                        size: 30,
                      color: AccentColor,
                    ),
                    expandedIcon: Icon(
                      CupertinoIcons.up_arrow,
                      size: 30,
                        color: AccentColor,
                    ),
                    collapsedTitlebackgroundColor: AppColor,
                    expandedTitlebackgroundColor: AppColor,
                  )
                ],
              ),
            )
          ],
        ),
	    ),
    );
  }
}


class _Row extends StatelessWidget {

  final TextStyle _value_style = TextStyle(
    color: Colors.pink,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    letterSpacing:1.2,
    wordSpacing: 2,
  );

  final TextStyle _field_style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w900,
    fontSize: 17,
    letterSpacing:1.2,
    wordSpacing: 2,
  );

  final String field;
  final String value;

  _Row(this.field,this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          field,
          style: _field_style,
        ),
        Text(
          value,
          style: _value_style,
        )
      ],
    );
  }
}
