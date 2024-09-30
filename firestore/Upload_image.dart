import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_database/firebase_database.dart';
import 'package:my_app/projects/utilz.dart';


class UploadImage extends StatefulWidget{
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  DatabaseReference databaseReference=FirebaseDatabase.instance.ref('post');
  firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;
  bool loading=false;
  File? image;
  final picker=ImagePicker();
 Future getimagegallery ()async{
  final pickedimage=await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
  setState(() {
    if(pickedimage!=null){
    image=File(pickedimage.path);
  }
  else{
    print('Image is not picked');
  }
  });
  
 }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                getimagegallery();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  )
                ),
                width: 200,
                height: 200,
                child:image!=null? Image.file(image!.absolute)
                  : Icon(Icons.image),
              ),
            ),
          ),
          SizedBox(height: 50,),
          ElevatedButton(
            onPressed: ()async{
              setState(() {
                loading=true;
              });
              final ID=DateTime.now().microsecondsSinceEpoch.toString();
            firebase_storage.Reference Ref=firebase_storage.
            
            FirebaseStorage.instance.ref('/folder/'+ID);
            firebase_storage.UploadTask uploadTask=Ref.putFile(image!.absolute);
             Future.value(uploadTask).then((value)async {
              var newurl=await Ref.getDownloadURL();
            databaseReference.child(ID).set({
              'id':ID,
              "Title":newurl.toString(),
            }).then((value){
              utils().toastmassege('uploaded image');
              setState(() {
                loading=false;
              });
              
            }).onError((error,StackTrace){
              utils().toastmassege(error.toString());
              setState(() {
                loading=false;
              });
            });
             });
            
            },
            child:loading?CircularProgressIndicator(
              color: Colors.white,strokeWidth: 2,
            )
             :Text('Update')),
            
        ],
      ),
    );
  }
}