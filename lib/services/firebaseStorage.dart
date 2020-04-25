import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

Future<void> uploadFile(File file, String filename, String Filetype) async {
	StorageReference storageReference;
	storageReference = FirebaseStorage.instance.ref().child("${Filetype}s/$filename");
	final StorageUploadTask uploadTask = storageReference.putFile(file);
	final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
	final String url = (await downloadUrl.ref.getDownloadURL());
	print("URL is $url");
	return false;
}