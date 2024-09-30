import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firestore/Upload_image.dart';
import 'package:my_app/post_screen.dart';
// import 'package:my_app/firestore/firestore_list.dart';
// import 'package:my_app/post_screen.dart';
import 'package:my_app/projects/login.dart';
class splashscreen extends StatefulWidget{
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  final auth=FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    final User=auth.currentUser;
    if(User!=null){
      Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, 
      (MaterialPageRoute(builder: (context)=>PostScreen())));
    });
    }
    else
    {
      Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, 
      (MaterialPageRoute(builder: (context)=>login())));
    });
    }
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Text('splash screen'),
    ),
  );
  }
}