import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:path/path.dart' as Path;
import '../db/post_dto.dart';

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  LocationData locationData;
  var locationService = Location();

  final formKey = GlobalKey<FormState>();
  final postFields = PostDTO();

  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile == null) //in case they cancel, go back to list screen
    {
      Navigator.of(context).pop();
    } else {
      image = File(pickedFile.path);
      setState(() {});
    }
  }

  Future<String> saveImage() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(Path.basename(image.path));
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    return await storageReference.getDownloadURL();
  }

  void addPost() async {
    postFields.imageURL = await saveImage();
    postFields.date = DateTime.now();
    postFields.latitude = locationData.latitude;
    postFields.longitude = locationData.longitude;

    Firestore.instance.collection('posts').add(postFields.toMap());
  }

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
    try {
      var _serviceEnabled = await locationService.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await locationService.requestService();
        if (!_serviceEnabled) {
          print('Failed to enable service. Returning.');
          return;
        }
      }

      var _permissionGranted = await locationService.hasPermission();
      if (_permissionGranted == PermissionStatus.DENIED) {
        _permissionGranted = await locationService.requestPermission();
        if (_permissionGranted != PermissionStatus.GRANTED) {
          print('Location service permission not granted. Returning.');
        }
      }

      locationData = await locationService.getLocation();
    } on PlatformException catch (e) {
      print('Error: ${e.toString()}, code: ${e.code}');
      locationData = null;
    }
    locationData = await locationService.getLocation();
    setState(() {});
  }

  Widget build(BuildContext context) {
    if (locationData == null) {
      return Center(child: CircularProgressIndicator());
    } else if (image == null) {
      getImage();
      return Center(child: CircularProgressIndicator());
    } else {
      return addPostForm();
    }
  }

  Widget addPostForm() {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.file(image)),
                    Expanded(child: numberInput()),
                    uploadButton()
                  ],
                ))));
  }

  Widget numberInput() {
    return Padding(
        child: TextFormField(
          decoration: InputDecoration(
              labelText: 'Quantity', border: OutlineInputBorder()),
          onSaved: (value) {
            postFields.quantity = int.parse(value);
          },
          validator: (value) {
            if (value.isEmpty ||
                int.tryParse(value) == null ||
                int.parse(value) < 1) {
              return 'Please enter a quantity greater than 1';
            } else
              return null;
          },
        ),
        padding: EdgeInsets.all(5.0));
  }

  Widget uploadButton() {
    return SizedBox(
        width: double.infinity,
        height: 100,
        child: RaisedButton(
          child: Text('Upload'),
          color: Colors.purple,
          textColor: Colors.white,
          onPressed: () {
            if (formKey.currentState.validate()) {
              //save form
              formKey.currentState.save();
              addPost();
              Navigator.of(context).pop();
            }
          },
        ));
  }
}
