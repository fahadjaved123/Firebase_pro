import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/post_screen.dart';
import 'package:my_app/projects/utilz.dart';

class VerifyCode extends StatefulWidget{
  final String verificationId;
VerifyCode({Key? key,required this.verificationId}):super(key: key);
  State<VerifyCode> createState(){
    return _VerifyCode();
  }
}
class _VerifyCode extends State<VerifyCode>{
  TextEditingController codecon=TextEditingController();
  bool loading=false;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('verfiyCode'),
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
                  controller: codecon,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.code),
                    prefixIconColor: Colors.white,
                    fillColor: Colors.white,
                    hintText: 'Enter code',
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
                onPressed:()async {
                  setState(() {
                    loading=true;
                  });
                  final cridential=PhoneAuthProvider.credential(
                    verificationId:widget.verificationId,
                     smsCode: codecon.text.toString());
                     try{
                      await _auth.signInWithCredential(cridential);
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context)=>PostScreen()));
                     }catch(e){
                      setState(() {
                        loading=false;
                      });
                      utils().toastmassege(e.toString());
                     }
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