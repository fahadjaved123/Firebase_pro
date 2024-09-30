import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/projects/utilz.dart';

class ForgetPassword extends StatefulWidget{
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailco=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
        centerTitle: true,
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 10),
            child: TextFormField(
              controller: emailco,
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
            
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2
                  )
                )
              ),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              _auth.sendPasswordResetEmail(email: emailco.text.toString()).then((value){
                utils().toastmassege('Email send to reset your passeord please check your Mail');
              }).onError((error,StackTrace){
                utils().toastmassege(error.toString());
              });
            }, 
            child: Text('Send')),
        ],
      ),
    );
  }
}