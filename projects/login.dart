import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/firestore/firestore_list.dart';
import 'package:my_app/projects/utilz.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/post_screen.dart';
class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}


class _loginState extends State<login> {
  bool Loading=false;
    final formkey=GlobalKey<FormState>();
    TextEditingController emailco=TextEditingController();
    TextEditingController passwordco=TextEditingController();
    FirebaseAuth _auth=FirebaseAuth.instance;
  Widget build(BuildContext context) {
 void Logi() {
  setState(() {
    Loading=true;
    // debugPrint(Loading.toString()); // true
  });
  _auth.signInWithEmailAndPassword(
    email: emailco.text, password: passwordco.text).then((value) {
      utils().toastmassege(value.user!.email.toString());
      setState(() {
        Loading=false;
        // debugPrint(Loading.toString());//false
      });
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context)=>PostScreen()));
    }).onError((error,StackTrace){
      utils().toastmassege(error.toString());
      setState(() {
        Loading=false;
        // debugPrint(Loading.toString());//false
      });
    });
}
   @override
  void dispose() {
    super.dispose();
    emailco.dispose();
    passwordco.dispose();
  }
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assests/images/login.png'),fit: BoxFit.cover)
        ),
        child: Center(
          child: Container(
            
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome \n Back ',
                style: TextStyle(fontSize: 40,
                fontFamily: 'fonts',color: Colors.black),),
                SizedBox(height: 10,),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailco,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter Your Email',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIconColor: Colors.black,
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Enter Your Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: passwordco,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIconColor: Colors.black,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return 'Enter Your Password';
                    }
                    return null;
                  },
                ),
                    ],
                  )
                  ),
                
                SizedBox(height: 10,),
                Container(
                  child: ElevatedButton(
                    onPressed:(){
                      if(formkey.currentState!.validate()){
                    Logi();
                      }
                    } ,
                    child: Loading? 
                    CircularProgressIndicator(
                      color: Colors.white,strokeWidth: 3,
                    ):Text('Login'),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have any account?"),
                    TextButton(
                      onPressed: () {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>Signup(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(3.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.fastEaseInToSlowEaseOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  },
                    child: Text('Sign Up'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}