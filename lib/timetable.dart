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

   final String day;

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
                height: MediaQuery.of(context).size.height*0.25,
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
                              TimeTableRow("7:30 - 10:15","10:45 - 1:30","2:30 - 5:15",0),
                              TimeTableRow("ASD","ASD","ASD",1),
                              TimeTableRow("ASD","ASD","ASDasd",1),
                              TimeTableRow("ASD","ASD","ASDasd",1),
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


class TimeTableRow extends StatefulWidget {

  final int val;
  final List<String> _subjects = new List<String>(3);
  final List<TextStyle> _style = [
    TextStyle(
      fontSize:15,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
    ),
    TextStyle(
      fontSize: 15,
      fontStyle: FontStyle.italic
    )
  ];

  TimeTableRow(String a, String b, String c,this.val){
    this._subjects[0]=a;
    this._subjects[1]=b;
    this._subjects[2]=c;
  }

  @override
  _TimeTableRowState createState() => _TimeTableRowState();
}

class _TimeTableRowState extends State<TimeTableRow> {

  @override
  Widget build(BuildContext context) {
    final double upper_bound = MediaQuery.of(context).size.height*0.0328;
    final double lower_bound = MediaQuery.of(context).size.height*0.016;
    final double boxHeight =MediaQuery.of(context).size.height*0.067;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            height: boxHeight,
            child: Center(
              child: Text(
                "${widget._subjects[0]}",
                style: widget._style[widget.val],
              ),
            )
        ),
        Divider(
          height: upper_bound,
          color: Colors.black,
          thickness: 1.2,
        ),
        Container(
            height: boxHeight,
            child: Center(
              child: Text(
                "${widget._subjects[1]}",
                style: widget._style[widget.val],
              ),
            )
        ),
        Divider(
          height: lower_bound,
          color: Colors.black,
          thickness: 1.2,
        ),
        Container(
            height: boxHeight,
            child: Center(
              child: Text(
                "${widget._subjects[2]}",
                style: widget._style[widget.val],
              ),
            )
        )
      ],
    );
  }
}
