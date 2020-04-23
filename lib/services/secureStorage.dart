import 'package:nie/main.dart';


Future getStorage() async {
	dynamic value = await storage.read(key: 'login');
	return value;
}

Future write(key, value) async {
	await storage.write(key: key, value: value);
}