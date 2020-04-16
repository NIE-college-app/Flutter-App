import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nie/globalvariables.dart';
import 'package:flutter/cupertino.dart';

class ImageUplaod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageCapture();
  }
}

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {

  File _imageFile;
  bool _isimg = false;

  void _clear() {
    setState(() {
      _imageFile = null;
      _isimg = false;
    });
  }

  Future<void> _pickImage() async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _imageFile = selected;
      _isimg = true;
    });
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Adjust Image',
          toolbarColor: AppColor,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false
      ),
      iosUiSettings: IOSUiSettings(
        title: 'Adjust Image',
      )
    );
    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AccentColor
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AccentColor,
          ),
        ),
        backgroundColor: AppColor,
      ),
      body: _isimg == true ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.file(_imageFile),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlineButton.icon
                      (onPressed: _cropImage,
                        icon: Icon(Icons.crop),
                        label: Text('Crop')
                    ),
                    OutlineButton.icon(
                        onPressed: _clear,
                        icon: Icon(CupertinoIcons.clear),
                        label: Text("Clear")
                    )
                  ],
                )
              ],
            ) :
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CupertinoButton(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        picker,
                        Text(textpicker)
                      ],
                    ),
                    onPressed: _pickImage,
                  ),
          ],
        ),
      )
    );
  }
}
