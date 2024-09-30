import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/add_post.dart';
import 'package:my_app/projects/login.dart';
import 'package:my_app/projects/utilz.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
class PostScreen extends StatefulWidget {  
  @override
  State<PostScreen> createState() => _PostScreenState();
  
}
class _PostScreenState extends State<PostScreen> {
  final searchfilter=TextEditingController();
  final auth=FirebaseAuth.instance;
    final Ref=FirebaseDatabase.instance.ref('post');
    final editcon=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              auth.signOut().then((value) {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context)=>login()));
              }).onError((error,StackTrace){
                utils().toastmassege(error.toString());
              });
            }, 
            icon: Icon(Icons.logout_outlined)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=>AddPost()));
        },
        child: Icon(Icons.add),
        ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: searchfilter,
            decoration:InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search,color: Colors.black,),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ) ,
            onChanged: (value) {
              setState(() {  
              });
            },
            ),
          ),  
        Expanded(
          child: FirebaseAnimatedList(
            query: Ref, 
            defaultChild: Text('Loading'),
            itemBuilder: (context,DataSnapshot,Animation,index){
              final tiTle=DataSnapshot.child('Title').value.toString().toUpperCase();
              if(searchfilter.text.isEmpty){
                 return ListTile(
                title: Text(DataSnapshot.child('Title').value.toString().toUpperCase(),
                style: TextStyle(fontFamily: 'fonts'),),
                subtitle: Text(DataSnapshot.child('ID').value.toString()),
                trailing: PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context)=>[
                    PopupMenuItem(
                      value: 1,
                      child:ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          Ref.child(DataSnapshot.child('ID').value.toString()).remove();
                        },
                        leading: Icon(Icons.delete),
                        title: Text('Delete'),
                      )
                      ),
                    PopupMenuItem(
                      value: 2,
                      child: ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          showMyDialog(tiTle,DataSnapshot.child('ID').value.toString());
                        },
                        leading: Icon(Icons.edit),
                        title: Text('Edit'),
                      ),
                      ),  
                  ],
                  
                ),
                
              );
              }
              else if(tiTle.toLowerCase().contains(searchfilter.text.toLowerCase())){
                 return ListTile(
                title: Text(DataSnapshot.child('Title').value.toString().toUpperCase(),
                style: TextStyle(fontFamily: 'fonts'),
                
                ),
                subtitle: Text(DataSnapshot.child('ID').value.toString()),
              );
              }
              else{
                return Container();
              }
              
            }
            ),
       )
        ],
      )
    );
  }
  Future<void> showMyDialog(String title,String id) async{
    editcon.text=title;
    return showDialog(
      context: context, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update'),
          content: Container(
            child: TextField(
              controller: editcon,
              decoration: InputDecoration(
                hintText: 'Edit'
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text('Cancle')),
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  Ref.child(id).update({
                    'Title':editcon.text.toString(),
                  }).then((value){
                    utils().toastmassege('Post is Updated');
                  }).onError((error,StackTrace){
                    utils().toastmassege(error.toString());
                  });
                }, 
                child: Text('UPdate'))
          ],
        );
      });
  }

}
          // stream bulider
          // Expanded(
          //   child: StreamBuilder(
          //     stream: Ref.onValue,
          //     builder: (context,AsyncSnapshot<DatabaseEvent> snapshot) {
                
          //       if(!snapshot.hasData){
          //        return CircularProgressIndicator(
          //         strokeWidth: 2,color: Colors.black,
          //        );
          //       }
          //       else{
          //         Map<dynamic,dynamic>map=snapshot.data!.snapshot.value as dynamic;
          //       List<dynamic>list=[];
          //       list=map.values.toList();
          //       list.clear();
          //          return ListView.builder(
          //       itemCount: snapshot.data!.snapshot.children.length,
          //       itemBuilder: (context,index){
          //       return ListTile(
          //         title: Text(list[index]["Title"].toString()),
          //         subtitle: Text(list[index]['ID'].toString()),
          //       );
          //     });
          //       }
             
          //   },)
          // ),

