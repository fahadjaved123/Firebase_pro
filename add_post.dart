import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:my_app/projects/utilz.dart';

class AddPost extends StatefulWidget{
  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
   bool loading=false;
 TextEditingController postco=TextEditingController();
 final databaseref=FirebaseDatabase.instance.ref('post');
 final databaseRef=FirebaseDatabase.instance.ref('list');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(fontFamily: 'fonts',fontSize: 20),
        title: Text('Add Post'),
      ),
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assests/images/register.png'),fit:BoxFit.fill )),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: TextFormField(
                  controller: postco,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "what is in your mind?",
                    hintStyle: TextStyle(color: Colors.white,fontFamily: 'fonts'),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 212, 50, 212),
                        width: 2,
                        
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                      
                      ),
                    border: OutlineInputBorder(
                      borderSide:BorderSide(
                        color: Colors.white,
                        width: 2,
                        
                      ) ,
                      
                      borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){ 
                  setState(() {
                    loading=true;
                  });
                  String ID=DateTime.now().microsecondsSinceEpoch.toString();
                  databaseref.child(ID)
                  .set({
                    'ID':ID,
                    'Title':postco.text.toString(),
                  })
                  
                  .then((value) {
                    utils().toastmassege('Post Add');
                    setState(() {
                      loading=false;
                      postco.text='';
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
                ) 
                :Text('Add'),),
            ),
            
          ],
        ),
      ),
    );
  }
}