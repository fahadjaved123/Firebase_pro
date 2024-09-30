import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/projects/utilz.dart';
import 'package:my_app/projects/verify_code.dart';

class Loginwithphone extends StatefulWidget{
  Loginwithphone({Key? key}):super(key: key);
  State<Loginwithphone> createState(){
    return _loginwithphone();
  }
  
}
class _loginwithphone extends State<Loginwithphone>{
  final phonenucon=TextEditingController();
  bool loading=false;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(image: AssetImage('assests/images/register.png'),fit: BoxFit.fill), ),
        child: Column(
          children: [
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                child: TextFormField(
                  controller: phonenucon,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_in_talk_rounded),
                    prefixIconColor: Colors.white,
                    fillColor: Colors.white,
                    hintText: '+1 234 5678 345',
                    hintStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      )
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      )
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              width: 300,
              child: ElevatedButton(
                onPressed:(){
                  setState(() {
                    loading=true;
                  });
                  _auth.verifyPhoneNumber(
                    phoneNumber: phonenucon.text,
                    verificationCompleted: (_){}, 
                    verificationFailed: (e){
                      utils().toastmassege(e.toString());
                       setState(() {
                    loading=false;
                  });
                    }, 
                    codeSent: (String verificationId, int? token) {
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: 
                          (context)=>VerifyCode(verificationId: verificationId,)));
                          setState(() {
                    loading=false;
                  });
                    }, 
                    codeAutoRetrievalTimeout: (e){
                      utils().toastmassege(e.toString());
                       setState(() {
                    loading=false;
                  });
                    });
                } , child: loading? CircularProgressIndicator(
                  strokeWidth: 2,color: Colors.white,
                )
                : Text('Save',style: TextStyle(fontFamily: 'fonts'),),
                style: ButtonStyle(
                  shadowColor: WidgetStateColor.transparent,
                ),
                ),
                
            )
          ],
        ),
      ),
    );
    
  }
}