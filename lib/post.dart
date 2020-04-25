import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nie/globalvariables.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'services/firebaseStorage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {

	bool sense = true;
	bool show = false;
	bool showPromise = false;
	bool sensePromise = false;


	double height = 300;
	double width = 300;

	double height2 = 0;
	double width2 = 0;


	@override
	void initState() {
		super.initState();
		sense = true;
		show = false;

	}

	void trans() {
		setState(() {
		  sense = !sense;
		  height = 0;
		  width = 0;
		  height2 = 300;
		  width2 = 300;
		});
	}

	void transh() {
		setState(() {
			show = !show;
		});
	}



	Future filePicker(BuildContext context) async {
		try {
			if (fileType == 'video') {
				file = await FilePicker.getFile(type: FileType.any);
				setState(() {
					show = true;
				});
				fileName = p.basename(file.path);
				setState(() {
					fileName = p.basename(file.path);
				});
				print(fileName);
				await uploadFile(file, fileName, fileType).then(
						(value) {
						trans();
					}
				);
				do{
					//
				}while(sense);

				Future.delayed(Duration(milliseconds: 1500), () => transh());
				print(sense);
			}
			if (fileType == 'audio') {
				file = await FilePicker.getFile(type: FileType.any);
				setState(() {
					show = true;
				});
				fileName = p.basename(file.path);
				setState(() {
					fileName = p.basename(file.path);
				});
				print(fileName);
				await uploadFile(file, fileName, fileType).then(
						(value) {
						trans();
					}
				);
				do{
					//
				}while(sense);

				Future.delayed(Duration(milliseconds: 1500), () => transh());
				print(sense);
			}
			if (fileType == 'others') {
				file = await FilePicker.getFile(type: FileType.any);
				setState(() {
					show = true;
				});
				fileName = p.basename(file.path);
				setState(() {
					fileName = p.basename(file.path);
				});
				print(fileName);
				await uploadFile(file, fileName, fileType).then(
					(value) {
						trans();
					}
				);
				do{
					//
				}while(sense);

				Future.delayed(Duration(milliseconds: 1500), () => transh());
				print(sense);
			}
		} on PlatformException catch (e) {
			showDialog(
				context: context,
				builder: (BuildContext context) {
					return AlertDialog(
						title: Text('Sorry...'),
						content: Text('Unsupported exception: $e'),
						actions: <Widget>[
							FlatButton(
								child: Text('OK'),
								onPressed: () {
									Navigator.of(context).pop();
								},
							)
						],
					);
				}
			);
		}
	}

	

	TextEditingController controller = new TextEditingController();
	TextEditingController Titlecontroller = new TextEditingController();
	TextEditingController Linkcontroller = new TextEditingController();
	bool event = false;
	DateTime date;
	DateTime tempdate;

	String fileType = '';
	File file;
	String fileName = '';
	String operationText = '';
	bool isUploaded = true;
	String result = '';


	String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RefreshIndicator(
		onRefresh: () {},
		child: Column(
			mainAxisAlignment: MainAxisAlignment.start,
			children: <Widget>[
				Text(
					"Create Post",
					style: TextStyle(
						fontSize: 70.0,
						fontWeight: FontWeight.w200,
					),
				),
				Stack(
					children: <Widget>[

						if(show && sense) Center(
							child: AnimatedContainer(
								curve: Curves.slowMiddle,
								duration: Duration(milliseconds: 300),
								height: height,
								width: width,
								child: FlareActor(
									'assets/animation/loaderAnimation.flr',
									alignment: Alignment.center,
									fit: BoxFit.cover,
									animation: 'Loading',
								),
							),
						)
						else if(show && sense == false) Center(
							child: AnimatedContainer(
								duration: Duration(milliseconds: 300),
								height: height2,
								width: width2,
								child: FlareActor(
									'assets/animation/hello.flr',
									alignment: Alignment.center,
									fit: BoxFit.cover,
									animation: 'Untitled',
								),
							),
						)
						else AnimatedContainer(
								duration: Duration(milliseconds: 300),
								curve: Curves.easeIn,
								child: Padding(
									padding: EdgeInsets.all(8),
									child: Card(
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(10),
										),
										elevation: 20,
										child: Column(
											children: <Widget>[
												Padding(
													padding: EdgeInsets.all(10),
													child: Row(
														mainAxisAlignment: MainAxisAlignment.spaceEvenly,
														children: <Widget>[
															DropdownButton<String>(
																value: dropdownValue,
																icon: Icon(Icons.arrow_downward),
																iconSize: 24,
																elevation: 16,
																style: TextStyle(
																	color: AppColor,
																),
																underline: Container(
																	height: 2,
																	color: AccentColor,
																),
																onChanged: (String newValue) {
																	setState(() {
																		dropdownValue = newValue;
																	});
																},
																hint: Text('Select Audience'),
																items: <DropdownMenuItem<String>>[
																	DropdownMenuItem(
																		child: Text("One"),
																		value: 'One',
																	),
																	DropdownMenuItem(
																		value: 'two',
																		child: Text("two"),
																	),
																	DropdownMenuItem(
																		value: 'three',
																		child: Text("three"),
																	)
																]
															),
														],
													),
												),
												Text(
													"Add",
													style: TextStyle(
														fontSize: 20,
														fontWeight: FontWeight.w700
													),
												),
												Padding(
													padding: EdgeInsets.all(10),
													child: Row(
														mainAxisAlignment: MainAxisAlignment.spaceEvenly,
														children: <Widget>[
															OutlineButton.icon(
																onPressed: () {
																	setState(() {
																		fileType = 'others';
																	});
																	filePicker(context);
																},
																icon: Icon(Icons.attach_file),
																label: Text("Files"),
															),
															OutlineButton.icon(
																onPressed: () {
																	setState(() {
																		fileType = 'video';
																	});
																	filePicker(context);
																},
																icon: Icon(Icons.videocam),
																label: Text("Video"),
															),
															OutlineButton.icon(
																onPressed: () {
																	showCupertinoModalPopup(
																		context: context,
																		builder: (_) {
																			return CupertinoActionSheet(
																				cancelButton: CupertinoButton(
																					child: Text("Cancel"),
																					onPressed: () => Navigator.of(context).pop(),
																				),
																				actions: <Widget>[
																					CupertinoActionSheetAction(
																						child: Row(
																							mainAxisAlignment: MainAxisAlignment.center,
																							children: <Widget>[
																								Icon(
																									CupertinoIcons.photo_camera,
																									color: AccentColor,
																									size: 30,
																								),
																								Text("Camera")
																							],
																						),
																						onPressed: () {
																							setState(() {
																								source = ImageSource.camera;
																								picker = Icon(
																									CupertinoIcons.photo_camera,
																									size: 90,
																								);
																								textpicker = 'Select a picture';
																							});
																							Navigator.of(context).pushNamed('/imageUpload');
																						},
																					),
																					CupertinoActionSheetAction(
																						child: Row(
																							mainAxisAlignment: MainAxisAlignment.center,
																							children: <Widget>[
																								Icon(
																									CupertinoIcons.collections,
																									color: AccentColor,
																								),
																								Text("Gallery")
																							],
																						),
																						onPressed: () {
																							setState(() {
																								source = ImageSource.gallery;
																								picker = Icon(
																									CupertinoIcons.collections,
																									size: 90,
																								);
																								textpicker = 'Select a picture';
																							});
																							Navigator.of(context).pushNamed('/imageUpload');
																						},
																					)
																				],
																			);
																		}
																	);
																},
																icon: Icon(Icons.image),
																label: Text('Photo')
															)
														],
													),
												),
												Padding(
													padding: EdgeInsets.all(10),
													child: TextField(
														controller: Titlecontroller,
														maxLines: null,
														keyboardType: TextInputType.multiline,
														style: TextStyle(
															fontWeight: FontWeight.w600,
															fontSize: 30,
														),
														decoration: new InputDecoration(
															focusColor: AppColor,
															focusedBorder: OutlineInputBorder(
																borderSide: BorderSide(color: AccentColor, width: 1.0),
															),
															enabledBorder: OutlineInputBorder(
																borderSide: BorderSide(color: AppColor, width: 1.0),
															),
															hintText: 'Post Title'
														),
													),
												),
												Padding(
													padding: EdgeInsets.all(10),
													child: TextField(
														controller: controller,
														maxLines: null,
														keyboardType: TextInputType.multiline,
														decoration: new InputDecoration(
															focusColor: AppColor,
															focusedBorder: OutlineInputBorder(
																borderSide: BorderSide(color: AccentColor, width: 1.0),
															),
															enabledBorder: OutlineInputBorder(
																borderSide: BorderSide(color: AppColor, width: 1.0),
															),
															hintText: 'Write your post\n\n\n\n\n\n'
														),
													),
												),
												Padding(
													padding: EdgeInsets.all(10),
													child: TextField(
														controller: Linkcontroller,
														maxLines: 1,
														keyboardType: TextInputType.url,
														decoration: new InputDecoration(
															focusColor: AppColor,
															focusedBorder: OutlineInputBorder(
																borderSide: BorderSide(color: AccentColor, width: 1.0),
															),
															enabledBorder: OutlineInputBorder(
																borderSide: BorderSide(color: AppColor, width: 1.0),
															),
															hintText: 'Link to register (if any)'
														),
													),
												),
												Padding(
													padding: EdgeInsets.all(10),
													child: Row(
														mainAxisAlignment: MainAxisAlignment.spaceBetween,
														children: <Widget>[
															Text(
																"Event",
																style: TextStyle(
																	fontSize: 25
																),
															),
															CupertinoSwitch(
																value: event,
																onChanged: (value) {
																	if(value) {
																		showCupertinoDialog(
																			context: context,
																			builder: (context) => CupertinoAlertDialog(
																				title: Text("Date \& Time of Event "),
																				actions: <Widget>[
																					Column(
																						mainAxisAlignment: MainAxisAlignment.center,
																						children: <Widget>[
																							SizedBox(
																								height: 300,
																								width: MediaQuery.of(context).size.width * 0.9,
																								child: CupertinoDatePicker(
																									mode: CupertinoDatePickerMode.dateAndTime,
																									onDateTimeChanged: (dateTime) {
																										tempdate = dateTime;
																									},
																								),
																							),
																							CupertinoDialogAction(
																								child: Text('Close'),
																								onPressed: () {
																									event = value;
																									date = tempdate;
																									print(date);
																									Navigator.of(context).pop();
																								}
																							)
																						],
																					)
																				],
																			));
																	}
																},
															)
														],
													),
												)
											],
										)
									),
								),
							)
					],
				)
			],
		),
	),
    );
  }
}
