import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nie/globalvariables.dart';
import 'package:nie/login.dart';
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
	landing = Login();

	return user;
}

Future<void> signOut() async{
	await FirebaseAuth.instance.signOut();
	loginStatus = false;
	FirebaseAuth.instance.signOut();
}