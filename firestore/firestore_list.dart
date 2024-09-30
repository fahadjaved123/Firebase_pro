import 'package:flutter/material.dart';
import 'package:my_app/firestore/firestor_post.dart';
import 'package:my_app/projects/login.dart';
import 'package:my_app/projects/utilz.dart';
import "package:cloud_firestore/cloud_firestore.dart";
class FireStorScreen extends StatefulWidget{
  @override
  State<FireStorScreen> createState() => _FireStorScreenState();
}

class _FireStorScreenState extends State<FireStorScreen> {
  TextEditingController updaco=TextEditingController();
  final searchfilter=TextEditingController();
  final fireStor=FirebaseFirestore.instance.collection('post').snapshots();
  CollectionReference Ref=FirebaseFirestore.instance.collection('post');
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Fire store '),
      actions: [
        IconButton(
          onPressed: (){
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context)=>login())
                )
                .onError((error,StackTrace){
                  utils().toastmassege(error.toString());
                });
          },
           icon: Icon(Icons.logout))
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        Navigator.push(
          context,MaterialPageRoute(
            builder: (context)=>FirestorPost()));
      },
      child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
            child: Container(
              child: TextFormField(
                controller: searchfilter,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: fireStor, 
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
              
              if(snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              else if(snapshot.hasError){
                return Text('some error');
              }

                 return Expanded(
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                final tiTle=snapshot.data!.docs[index]['title'].toString();
                return ListTile(
                  title: Text(snapshot.data!.docs[index]['title'].toString().toUpperCase()),
                  subtitle: Text(snapshot.data!.docs[index]['ID'].toString()),
                  trailing: PopupMenuButton(
                    icon: Icon(Icons.more_vert),
                    itemBuilder: (context) =>[
                      PopupMenuItem(
                        value: 1,
                        child: ListTile(
                          onTap: () {
                            Navigator.pop(context);
                            showMyDialog(tiTle,snapshot.data!.docs[index]['ID']);
                          },
                          title: Text('Edit'),
                          leading: Icon(Icons.edit),
                        ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              Ref.doc(snapshot.data!.docs[index]['ID'].toString()).delete();
                            },
                            title: Text('Delete'),
                            leading: Icon(Icons.delete),
                          ),
                          )
                    ]
                  ),
                );
              })
            );
            }
            ),
          
        ],
      ),
   );
  }
  Future<void> showMyDialog(String title,String id ) async{
    updaco.text=title;
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upadte'),
          content: Container(
            child:TextField(
              controller: updaco,
              decoration: InputDecoration(
                hintText: 'Edit ',

              ),
            ) ,
          ),
          actions: [
            TextButton(
              onPressed:(){
                Navigator.pop(context);
              }, 
              child: Text('Cancel')),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  Ref.doc(id).update({
                    'title':updaco.text.toString(),
                  }).then((value){
                    utils().toastmassege('Updated');
                  }).onError((error,StackTrace){
                    utils().toastmassege(error.toString());
                  });
                }, 
                child: Text('Edit')),
          ],
        );
      });
      
  }
}