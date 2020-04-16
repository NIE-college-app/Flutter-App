import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:getflutter/components/accordian/gf_accordian.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';


import 'globalvariables.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time Table"
        ),
        backgroundColor: AppColor,
        centerTitle: true,
      ),

//data['Branch']+'-'+data['Semester']+data["Section"]
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Text(
                    data['Branch']+'-'+data['Semester']+data["Section"],
                    style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.w200
                    ),
                  ),
                ),

                //Time table tiles start from here
                Daily_TimeTable("Monday"),
                Daily_TimeTable("Tuesday"),
                Daily_TimeTable("Wednesday"),
                Daily_TimeTable("Thursday"),
                Daily_TimeTable("Friday"),
                Daily_TimeTable("Saturday"),
              ],
            ),
          ),
        ),
      ),

    );
  }
}


class Daily_TimeTable extends StatefulWidget {

   String day;

  Daily_TimeTable(this.day);

  @override
  _Daily_TimeTableState createState() => _Daily_TimeTableState();
}

class _Daily_TimeTableState extends State<Daily_TimeTable> {
  double iconSize = 20;

  final TextStyle fieldStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          elevation: 20,
          child:GFAccordion(
            titleChild:  GFListTile(
              title: Text(
                this.widget.day,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.justify,
              ),
              subtitleText: "Timetable for ${widget.day.toLowerCase()}",
            ),





            contentChild: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:Container(
                child: Column(
                  children: <Widget>[
                    Table(
                      border: TableBorder.all(
                        width: 1.0,
                        color: Colors.black,

                      ),
                      children: [
                        TableRow(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text("\n7:30 - 10:15",style: fieldStyle),
                                  Divider(
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                  Text("10:45 - 1:30",style:fieldStyle),
                                  Divider(
                                    thickness: 1.2,
                                    color: Colors.black,
                                  ),
                                  Text("2:30 - 5:15",style:fieldStyle)
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("\nASD"),
                                  Divider(
                                    height: 24,
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                  Text("ASD"),
                                  Divider(
                                    height: 12,
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                  Text("ASD\n")
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("\nASD"),
                                  Divider(
                                    height: 24,
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                  Text("ASD"),
                                  Divider(
                                    height: 12,
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                  Text("ASD\n")
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text("\nASD"),
                                  Divider(
                                    height: 24,
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                  Text("ASD"),
                                  Divider(
                                    height: 12,
                                    color: Colors.black,
                                    thickness: 1.2,
                                  ),
                                  Text("ASD\n")
                                ],
                              ),
                            ]
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            expandedIcon: Icon(
              CupertinoIcons.up_arrow,
              size: 30,
              color: AccentColor,
            ),
            collapsedIcon: Icon(
              CupertinoIcons.down_arrow,
              size:30,
              color: AccentColor,
            ),
          )
      ),
    );
  }
}
