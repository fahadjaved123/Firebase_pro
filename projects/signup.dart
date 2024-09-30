import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/projects/forget_password.dart';
import 'package:my_app/projects/loginwithphone.dart';
import 'package:my_app/projects/slpash.dart';
import 'package:my_app/projects/utilz.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp() ;
  return runApp(my_app());
}
class my_app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo.shade100,
        useMaterial3: false,
      ),
      home: splashscreen(),
    );
  }
}
class Signup extends StatefulWidget{
  Signup({Key? key}):super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey=GlobalKey<FormState>();
  TextEditingController emailco=TextEditingController();
  TextEditingController nameco=TextEditingController();
  TextEditingController passwordco=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  utils Utils=utils();
  bool loading =false;
  @override
  void dispose() {
    super.dispose();
    emailco.dispose();
    nameco.dispose();
    passwordco.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // existing the app screen
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // for removing the on top screen
          // automaticallyImplyLeading: false,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assests/images/register.png',),fit: BoxFit.cover),
            ),
          child: Center(
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text('Create',style: TextStyle(fontSize: 40,fontFamily: 'fonts',color: Colors.white),),
                    // Text('Account',style: TextStyle(fontSize: 40,fontFamily: 'fonts',color: Colors.black),),
                    RichText(
                      text:const TextSpan(
                      children: [
                          TextSpan(text: 'Create\n',
                          style: TextStyle(fontSize: 40,
                          fontFamily: 'fonts',color: Colors.white)),
                          TextSpan(text: 'Account',
                          style: TextStyle(fontSize: 40,
                          fontWeight: FontWeight.bold,fontFamily: 'fonts'
                          ,color: Colors.black,)),
                        ]
                      )),
                   const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: nameco,
                      keyboardType: TextInputType.name,
                      
                      decoration: InputDecoration(
                        hintText: 'Enter Your Name ',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIconColor: Colors.white,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          
                        ),
                        
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          
                        ),
                        
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter your name';
                        }
                        return null ;
                      },
                    ),
                    SizedBox(height: 10,),
                     TextFormField(
                      controller: emailco,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Email ',
                        prefixIconColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ), enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          ),
                      ),
                      validator:(value) {
                        if(value!.isEmpty){
                          return 'Enter your email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                     TextFormField(
                      controller: passwordco,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password ',
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIconColor:  Colors.white,
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white,
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                          ),
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    ],
                      )),
                    SizedBox(height: 10,),
                    Container(
                      width: 300,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: (){
                        if(formkey.currentState!.validate()){
                          setState(() {
                          loading=true;
                            
                          });
                          _auth.createUserWithEmailAndPassword(
                            email: emailco.text.toString(), password: passwordco.text.toString()).then((value) {
                              setState(() {
                                loading=false;
                              });
                              Navigator.push(
                                context, MaterialPageRoute(
                                  builder: (context)=>login()));
                                  utils().toastmassege('Your account is created');
                            }).onError((error,StackTrace){
                              Utils.toastmassege(error.toString());
                              setState(() {
                              loading=false;
                              });  
                            });
                        }
                      }, child:loading? CircularProgressIndicator(
                        color: Colors.white,strokeWidth: 3,
                      ):
                       Text('Sign Up')),
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? '),
                         TextButton(
                            onPressed: () {
                              
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => login(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    const begin = Offset(3.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.fastEaseInToSlowEaseOut;
                                    var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                    var offsetAnimation = animation.drive(tween);
                          
                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text("Login"),
                          ),
                          
                      ],
                    ),
                    TextButton(
                      onPressed: (){
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context)=>ForgetPassword()));
                      }, 
                      child: Text('Forget password')),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(
                            builder: (context)=>Loginwithphone()));
                      },
                      child: Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                              child: Center(child: Text('Login With Phone Number',
                              style: TextStyle(color: Colors.white,fontFamily: 'fonts',
                              fontSize: 17,fontWeight: FontWeight.bold,shadows: [
                                Shadow(
                                  color: Colors.black,
                                  offset: Offset(1.0, 2.0),
                                  blurRadius: 2,
                                  
                                )
                              ]
                              ),)),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}