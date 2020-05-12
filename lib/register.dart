import 'package:flutter/cupertino.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:nie/globalvariables.dart';
import 'login.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  bool active;

  ScrollController _controller = ScrollController();

  String dropDownValue;
  String dropDownValueYear;

  bool ema = false;
  bool phone = false;
  bool nam = false;


  @override
  void initState() {
    super.initState();
    active = false;
    if(data['email'] != '') {
      ema = true;
    }
    if(data['num'] != '' && data['num'] != null) {
      phone = true;
    }
    if(data['displayName'] != '') {
      nam = true;
    }
    print(data);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: true,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 90.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                    TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 95.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: AppColor),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _controller,
              child: Form(
                key: _formKey,
                child: Container(
                    padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0, bottom: 0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (value){
                            String regex="^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$";
                            if(RegExp(regex).hasMatch(value)){
                              return null;
                            }else{
                              return "Invalid email";
                            }
                          },
                          enabled: !ema,
                          initialValue: ema ? data['email'] : null,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              // hintText: 'EMAIL',
                              // hintStyle: ,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColor))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          validator: (String value){
                            if(value.isEmpty){
                              return "Enter a valid name";
                            }else if(value.length<=6){
                              return "Password must be longer than 6 characters";
                            }else{
                              setState(() {
                                data['name']=value;
                              });
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'PASSWORD ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColor))),
                          obscureText: true,
                        ),

                        SizedBox(height: 10.0),
                        TextFormField(
                          enabled: !nam,
                          initialValue: nam ? data['displayName'] : null,
                          decoration: InputDecoration(
                              labelText: 'NAME ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColor))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          enabled: !phone,
                          initialValue: phone ? data['num'] : null,
                          keyboardType: TextInputType.numberWithOptions(signed: false,decimal: false),
                          validator: (String value){
                            if(value.isEmpty){
                              return "Enter a valid phone number";
                            }else if(value.contains(RegExp(r'[0-9]')) && value.length<10){
                              return "Enter a valid number";
                            }
                            else{
                              setState(() {
                                data['contact']=value;
                              });
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'PHONE NUMBER ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColor))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          validator: (String value){
                            if(value.isEmpty){
                              return "Enter a valid USN";
                            }else{
                              setState(() {
                                data['USN']=value;
                              });
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'USN ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColor))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          validator: (String value){
                            if(value.isEmpty){
                              return "Enter a valid section";
                            }else{
                              setState(() {
                                data['USN']=value;
                              });
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'SECTION ',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: AppColor))),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: DropdownButtonFormField(
                                validator: (String value){
                                  if(value==null || value.isEmpty){
                                    return "Choose one option";
                                  }else{
                                    setState(() {
                                      data['Department']=value;
                                    });
                                    return null;
                                  }
                                },
                                items: ["Civil","CSE","ECE","EEE","IPE","ISE","MCA","Mech"].map<DropdownMenuItem<String>>((String value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value) ,
                                  );
                                }).toList(),
                                onChanged: (String value){
                                  setState(() {
                                    dropDownValue = value;
                                  });
                                },

                                decoration: InputDecoration(
                                  hintText: "Choose your Department",
                                  labelText: "Department",
                                ),
                                value: dropDownValue,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: DropdownButtonFormField(
                                validator: (String value){
                                  if(value==null || value.isEmpty){
                                    return "Choose one option";
                                  }else{
                                    setState(() {
                                      data['Semester']=value;
                                    });
                                    return null;
                                  }
                                },
                                items: [1,2,3,4,5,6,7,8].map<DropdownMenuItem<String>>((int value){
                                  return DropdownMenuItem<String>(
                                    value: value.toString(),
                                    child: Text(value.toString()) ,
                                  );
                                }).toList(),
                                onChanged: (String value){
                                  setState(() {
                                    dropDownValueYear = value;
                                  });
                                },
                                value: dropDownValueYear,
                                decoration: InputDecoration(
                                  hintText: "Choose your Semester",
                                  labelText: "Semester",

                                ),
                              ),
                            )

                          ],
                        ),
                        SizedBox(height: 40.0),
                        ProgressButton(
                          defaultWidget: Center(
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                          color: active ? Colors.white : AppColor,
                          borderRadius: 50,
                          progressWidget: CupertinoActivityIndicator(),
                          width: MediaQuery.of(context).size.width,
                          onPressed: () async {
                            setState(() {
                              active = true;
                            });
                            await Future.delayed(Duration(seconds: 1), submitData());
                            setState(() {
                              active = false;
                            });
                          },
                        ),
                        SizedBox(height: 30,)
                      ],
                    )),
              ),
            ),
          )


        ]));
  }

  submitData()async{
    if(_formKey.currentState.validate()){
      debugPrint("valid");
      await storage.write(key: 'email', value: data['email']);
      await storage.write(key: 'name', value: data['displayName']);
      await storage.write(key: 'num', value: data['contact']);
      await storage.write(key: 'usn', value: data['USN']);
      await storage.write(key: 'sem', value: data['Semester']);
      await storage.write(key: 'section', value: data['Section']);
      await storage.write(key: 'pic', value: data['photoUrl']);
      await storage.write(key: 'branch', value: data['Branch']);
      await storage.write(key: 'logged', value: 'true');
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => Login())
        );
      });
    }
  }
}
