import 'package:shared_preferences/shared_preferences.dart';
import 'package:nie/globalvariables.dart';

Future<void> LocalStorage() async {

	SharedPreferences prefs = await SharedPreferences.getInstance();
	await prefs.setString('name', 'iresh');
	var localStorage = prefs.get('name');
	print(localStorage);
}