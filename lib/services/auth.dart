import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/login.dart';
import 'package:nie/main.dart';
import 'package:nie/router.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<FirebaseUser> handleSignIn() async {
	final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
	final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

	final AuthCredential credential = GoogleAuthProvider.getCredential(
		accessToken: googleAuth.accessToken,
		idToken: googleAuth.idToken,
	);

	final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
	print("signed in " + user.displayName);

//	await storage.write(key: 'email', value: user.email);
//	await storage.write(key: 'name', value: user.displayName);
//	await storage.write(key: 'num', value: user.phoneNumber);
//	await storage.write(key: 'photoUrl', value: user.photoUrl);

	data['displayName'] = user.displayName;
	data['email'] = user.email;
	data['photoUrl'] = user.photoUrl;
	data['num'] = user.phoneNumber;
	print(data);
	return user;
}

Future<void> signOut() async{
	await FirebaseAuth.instance.signOut();
	await storage.deleteAll();
	await storage.write(key: 'logged', value: 'false');
	loginStatus = 'false';
	FirebaseAuth.instance.signOut();
}