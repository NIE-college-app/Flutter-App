import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nie/globalvariables.dart';

import 'login.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

final _formKey = GlobalKey<FormState>();

String dropDownValue;
String dropDownValueYear;

var buttonColor = Colors.green;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "REGISTER"
        ),
      ),


      //USN
      //phone
      //Groups


      body: SingleChildScrollView(
        child: Container  (
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[

                //Phone number
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter your Phone number",
                        labelText: "Phone number",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          ),
                        ),

                        labelStyle: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.bold
                        )
                    ),

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
                  ),
                ),

                //USN
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your USN",
                        labelText: "USN",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          ),
                        ),

                        labelStyle: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.bold
                        )
                    ),

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
                  ),
                ),

                //Section
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your Section",
                        labelText: "Section",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          ),
                        ),

                        labelStyle: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.bold
                        )
                    ),

                    validator: (String value){
                      if(value.isEmpty){
                        return "Enter a section";
                      }else{
                        setState(() {
                          data['Section']=value;
                        });
                        return null;
                      }
                    },
                  ),
                ),

                //Department
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButtonFormField(
                    items: ["Civil","CSE","ECE","EEE","IPE","ISE","MCA","Mech"].map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value) ,
                      );
                    }).toList(),
                    onChanged: (String value){
                      setState(() {
                        dropDownValue = value;
                      });;
                    },
                    value: dropDownValue,
                    elevation: 20,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        hintText: "Choose your department",
                        labelText: "Department",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          ),
                        ),

                        labelStyle: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    validator: (String value){
                      if(value==null || value.isEmpty){
                        return "Choose one option";
                      }else{
                        data['Branch']=dropDownValue;
                        return null;
                      }
                    },
                  ),
                ),

                //Semester
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButtonFormField(
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
                    elevation: 20,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                        hintText: "Choose your Semester",
                        labelText: "Semester",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),

                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                              color: Colors.red,
                              width: 2
                          ),
                        ),

                        hintStyle: TextStyle(
                            backgroundColor: Colors.transparent
                        ),

                        labelStyle: TextStyle(
                            backgroundColor: Colors.transparent,
                            fontWeight: FontWeight.bold
                        )

                    ),
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
                  ),
                ),

                //Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: submitData,
                    elevation: 15,
                    color: buttonColor,
                    child: Text(
                        "Submit"
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)
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

  submitData(){
    if(_formKey.currentState.validate()){
      debugPrint("valid");
      Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) => Login())
      );
    }
  }

}
