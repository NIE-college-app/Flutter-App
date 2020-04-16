import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nie/globalvariables.dart';


class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {

	TextEditingController controller = new TextEditingController();
	TextEditingController Titlecontroller = new TextEditingController();
	bool event = false;
	DateTime date;
	DateTime tempdate;

	String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
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
				Padding(
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
												icon: Icon(Icons.add),
												label: Text('Add Photo')
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
				)
			],
		),
	);
  }
}
