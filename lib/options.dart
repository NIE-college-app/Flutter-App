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


    return RefreshIndicator(
      displacement: 30.0,
      onRefresh: (){},
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height*0.05, 0, MediaQuery.of(context).size.height*0.07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 50,
                  margin: EdgeInsets.all(6),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      GFAccordion(
                        titleChild: Container(
                              height: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  Flexible(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Flexible(
                                            child: Text(
                                                data['displayName'].split(' ')[0],
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                              ),
                                              overflow: TextOverflow.fade,
                                              softWrap: true,
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              '\n'+data['USN'],
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              overflow: TextOverflow.fade,
                                              softWrap: true,
                                            ),
                                          )
                                        ],
                                      ),
                                  ),

                                ],
                              )
                          ),
                        contentChild: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              _Row("Name: "," ${data['displayName']}"),
                              _Row("USN: "," ${data['USN']}"),
                              _Row("Contact: "," ${data['contact']}"),
                              _Row("Email: "," ${data['email']}"),
                              _Row("Department: "," ${data['Branch']}"),
                              _Row("Semester: "," ${data['Semester']}"),
                              _Row("Section: "," ${data['Section']}"),
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
//                    collapsedTitlebackgroundColor: Theme.of(context).,
//                    expandedTitlebackgroundColor: Colors.white,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: ()=>debugPrint("GOING TO TIMETABLE"),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFListTile(
                        titleText: "Time Table",
                        subtitleText: "Check your time table",
                        icon: Icon(
                          Icons.calendar_today,
                          color: AccentColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: ()=>debugPrint("GOING TO SYLLABUS"),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GFListTile(
                        titleText: "Syllabus",
                        subtitleText: "Check your syllabus",
                        icon: Icon(
                          Icons.import_contacts,
                          color: AccentColor,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
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
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            field,
            style: _field_style,
          ),
          Flexible(
            child: Text(
              value,
              style: _value_style,
            ),
          )
        ],
      ),
    );
  }
}
