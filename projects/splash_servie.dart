import 'dart:async';
import 'login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SplashServie {
  void islogin(BuildContext context){
    void islogin(BuildContext context){
      Timer(Duration(seconds: 1),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
      });
    }
  }
  
}