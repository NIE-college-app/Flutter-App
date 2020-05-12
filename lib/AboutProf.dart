import 'dart:typed_data';
import 'dart:io';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:vcard/vcard.dart';

class ProfData{
  final String name;
  final Map<String,String> data;
  ProfData(this.name,this.data);
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {



	TextStyle _style(){
		return TextStyle(
			fontWeight: FontWeight.bold
		);
	}

	final Widget call = SvgPicture.asset(
		'assets/svg/icons8-phone.svg',
		height: 30,
		width: 30,
	);

	final Widget sms = SvgPicture.asset(
		'assets/svg/icons8-messaging.svg',
		height: 30,
		width: 30,
	);

	final Widget mail = SvgPicture.asset(
		'assets/svg/icons8-email.svg',
		height: 30,
		width: 30,
	);

	final Widget copy = SvgPicture.asset(
		'assets/svg/icons8-copy.svg',
		height: 30,
		width: 30,
	);

	@override
	Widget build(BuildContext context) {

		void copyToClipBoard(BuildContext context,String data) {
			Clipboard.setData(
				ClipboardData(
					text: data
				)
			);
			Scaffold.of(context).showSnackBar(SnackBar(
				content: Text("Copied to Clipboard!"),
				elevation: 20,
			));

		}
		final ProfData args = ModalRoute.of(context).settings.arguments;
		return Scaffold(
			appBar: CustomAppBar(),
			body: Builder(
				builder: (BuildContext context) {
					return Container(
						padding: EdgeInsets.symmetric(horizontal: 16),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								Text("Name", style: _style()),
								SizedBox(height: 4,),
								Text(args.name,),
								SizedBox(height: 16,),

								Text("Department", style: _style()),
								SizedBox(height: 4,),
								Text(args.data['dept'],),
								SizedBox(height: 16,),

								Text("Email", style: _style(),),
								SizedBox(height: 4,),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										Text(args.data['email']),
										Container(
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													GestureDetector(
														child: mail,
														onTap: () {
															launch("mail:${args.data['email']}");
														},
													),
													GestureDetector(
														child: copy,
														onTap: () => copyToClipBoard(context, args.data['email'])
													)
												],
											),
											width: MediaQuery.of(context).size.width*0.2,
										)
									],
								),
								SizedBox(height: 16,),

								Text("Number", style: _style(),),
								SizedBox(height: 4,),
								Row(
									mainAxisSize: MainAxisSize.max,
									mainAxisAlignment: MainAxisAlignment.spaceBetween,
									children: <Widget>[
										Text(args.data['num']),
										Container(
											width: MediaQuery.of(context).size.width*0.3,
											child: Row(
												mainAxisAlignment: MainAxisAlignment.spaceBetween,
												children: <Widget>[
													GestureDetector(
														child: sms,
														onTap: () {
															launch("sms:${args.data['num']}");
														},
													),
													GestureDetector(
														child: call,
														onTap: () {
															launch("tel:${args.data['num']}");
														},
													),
													GestureDetector(
														child: copy,
														onTap: () => copyToClipBoard(context, args.data['num']),
													)
												],
											),
										)
									],
								),
								SizedBox(height: 16,),

								Text("About", style: _style(),),
								SizedBox(height: 4,),
								Text(args.data['About']),
								SizedBox(height: 16,),

								Text("Read More", style: _style(),),
								SizedBox(height: 4,),
								GestureDetector(
									child: Text(
										args.data['Read More'],
										style: TextStyle(
											color: Colors.orangeAccent
										),
									),
									onTap: () {
										launch(args.data['Read More']);
									},
								),
								SizedBox(height: 16,),

								Divider(color: Colors.grey,)
							],
						),
					);
				},
			),
		);
	}



}



final String url = "http://chuteirafc.cartacapital.com.br/wp-content/uploads/2018/12/15347041965884.jpg";

class CustomAppBar extends StatefulWidget with PreferredSizeWidget{
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 320);
}

class _CustomAppBarState extends State<CustomAppBar> {

	String _platformVersion = 'Unknown';

	@override
	void initState() {
		super.initState();
	}



	addconPer(String name, Map<String, dynamic> val) async {
		await Permission.contacts.request();

		var serviceStatus = await Permission.contacts.status;

		if (serviceStatus.isGranted) {
			addCon(name, val);
		}
	}

//	sharePer(String name, Map<String, dynamic> val) async {
//		await SimplePermissions.requestPermission(Permission.ReadExternalStorage).then((val) {});
//		await SimplePermissions.requestPermission(Permission.WriteExternalStorage).then((value) async {
//			if(Platform.isAndroid) {
//				if(await SimplePermissions.checkPermission(Permission.WriteExternalStorage) && await SimplePermissions.checkPermission(Permission.ReadExternalStorage)) {
//					share(name, val);
//				}
//			}
//			else {
//				if(await SimplePermissions.getPermissionStatus(Permission.WriteExternalStorage) == PermissionStatus.authorized && await SimplePermissions.getPermissionStatus(Permission.ReadExternalStorage) == PermissionStatus.authorized) {
//					share(name, val);
//				}
//			}
//		});
//	}


	share(name, val) async {
		var vCard = VCard();
		vCard.firstName = name;
		vCard.organization = 'The National Institute of Engineering';
		vCard.jobTitle = val['dept'];
		vCard.photo.attachFromUrl(val['photoUrl'], 'jpg');
		vCard.workPhone = val['num'];
		vCard.workEmail = val['email'];

		vCard.saveToFile('/$name.vcf');

		Directory directory;

		if (Platform.isAndroid) {
			directory = await getExternalStorageDirectory();
		} else {
			directory = await getApplicationDocumentsDirectory();
		}

		await FlutterShare.shareFile(
			title: name,
			text: "$name.vcf",
			filePath: "${directory.path}$name.vcf"
		);
	}

	addCon(String name, Map<String, dynamic> val) async {
		Contact prof = Contact(
			androidAccountName: name,
			givenName: name,
			company: 'The National Institute of Engineering',
			jobTitle: val['dept'],
			emails: <Item>[
				Item(
					label: 'Work',
					value: val['email']
				)
			],
			phones: [
				Item(
					label: 'Work',
					value: val['num']
				)
			],
		);
		await ContactsService.getContacts().then((contact) async {
			print(contact.contains(prof));
			bool contain = false;
			contact.forEach((con) {
				if(con.givenName == name) {
					contain = true;
				}
			});
			if(contain) {
				Scaffold.of(context).showSnackBar(SnackBar(
					content: Text("Contact already exists!"),
					elevation: 20,
				));
			}
			else {
				await ContactsService.addContact(prof);
			}
		});
	}

	final Widget call = SvgPicture.asset(
		'assets/svg/icons8-phone.svg',
		height: 20,
		width: 20,
	);

	@override
	Size get preferredSize => Size(double.infinity, 320);

	@override
	Widget build(BuildContext context) {
		final ProfData args = ModalRoute.of(context).settings.arguments;
		return ClipPath(
			clipper: MyClipper(),
			child: Container(
				height: MediaQuery.of(context).size.height*0.3,
				padding: EdgeInsets.only(top: 4),
				decoration: BoxDecoration(
					color: Colors.blueAccent,
					boxShadow: [
						BoxShadow(
							color: Colors.red,
							blurRadius: 20,
							offset: Offset(0, 0)
						)
					]
				),
				child: Padding(
					padding: EdgeInsets.only(top: 30),
					child: Column(
						children: <Widget>[
							Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
								children: <Widget>[
									IconButton(
										icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
										onPressed: (){
											Navigator.of(context).pop();
										},
									),
									Container(
										child: Row(
											children: <Widget>[
												IconButton(
													icon: Icon(Icons.share),
													onPressed: () => share(args.name, args.data),
												),
												IconButton(
													icon: Icon(Icons.person_add),
													onPressed: () => addconPer(args.name, args.data),
												)
											],
										),
									)

								],
							),

							Row(
								mainAxisAlignment: MainAxisAlignment.spaceAround,
								children: <Widget>[

									Column(
										children: <Widget>[
											Container(
												width: 100,
												height: 100,
												decoration: BoxDecoration(
													shape: BoxShape.circle,
													image: DecorationImage(
														fit: BoxFit.cover,
														image: NetworkImage(args.data['image'])
													)
												),
											),
										],
									),
									Text(
										args.name,
										style: TextStyle(
											color: Colors.white,
											fontWeight: FontWeight.w600,
											fontFamily: 'Montserrat',
											fontSize: 40
										),
									)
								],
							),
							SizedBox(height: 8,),

							Align(
								alignment: Alignment.bottomRight,
								child: GestureDetector(
									onTap: (){
										launch("tel:${args.data['num']}");
									},
									child: Padding(
										padding: const EdgeInsets.fromLTRB(0, 24, 16, 0),
										child: Transform.rotate(
											angle: (3.14 * 0.05),
											child: Container(
												width: 110,
												height: 32,
												child: Center(child: Row(
													mainAxisAlignment: MainAxisAlignment.center,
													children: <Widget>[
														call,
														Text("   Call")
													],
												),),
												decoration: BoxDecoration(
													color: Colors.white,
													borderRadius: BorderRadius.all(Radius.circular(16)),
													boxShadow: [
														BoxShadow(
															color: Colors.black12,
															blurRadius: 20
														)
													]
												),
											),
										),
									),
								),
							)
						],
					),
				),
			),
		);
	}
}


class MyClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    Path p = Path();

    p.lineTo(0, size.height-70);
    p.lineTo(size.width, size.height);

    p.lineTo(size.width, 0);

    p.close();


    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}