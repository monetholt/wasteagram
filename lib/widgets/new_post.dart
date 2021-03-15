import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class NewPost extends StatefulWidget {
  @override
  _NewPostState createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final formKey = GlobalKey<FormState>();

  int quantity;
  File image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);

    setState(() {});
  }

  Future<String> saveImage() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(Path.basename(image.path));
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    return await storageReference.getDownloadURL();
  }

  void addPost() async{
    final timestamp = DateTime.now();
    final imageURL = saveImage();
    print("done!");
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      getImage();
      return Center(child: CircularProgressIndicator());
    } else {
      return addPostForm();
    }
  }

  Widget addPostForm() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.file(image),
                Padding(
                    child: TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(
                          labelText: 'Quantity', border: OutlineInputBorder()),
                      onSaved: (value) {
                        quantity = int.parse(value);
                      },
                      validator: (value) {
                        if (value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.parse(value) < 1) {
                          return 'Please enter a quantity greater than 1';
                        } else return null;
                      },
                    ),
                    padding: EdgeInsets.all(5.0)),
                RaisedButton(
                  child: Text('Save'),
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
                )
              ],
            )));
  }
}
