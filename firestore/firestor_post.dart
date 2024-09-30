import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/projects/utilz.dart';

class FirestorPost extends StatefulWidget{
  @override
  State<FirestorPost> createState() => _FirestorPostState();
}

class _FirestorPostState extends State<FirestorPost> {
  bool loading=false;
  final postcon=TextEditingController();
  final firestor=FirebaseFirestore.instance.collection('post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestor Add post'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
            child: TextFormField(
              controller: postcon,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'What is in your mind?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  )
                )
              ),
            ),
          ),
          SizedBox(height: 40,),
          ElevatedButton(
            onPressed: (){
              setState(() {
                loading=true;
              });
              String ID=DateTime.now().microsecondsSinceEpoch.toString();
              firestor.doc(ID).set({
                'ID':ID,
                'title':postcon.text,
              }).then((value) {
                utils().toastmassege('Add Posted');
                setState(() {
                  loading=false;
                });
              }).onError((error,StackTrace){
                utils().toastmassege(error.toString());
                setState(() {
                  loading=false;
                });
              });
            }, 
            child:loading? CircularProgressIndicator(
              color: Colors.white,strokeWidth: 2,
            ):
             Text('Add'))
        ],
        
      ),
    );
  }
}