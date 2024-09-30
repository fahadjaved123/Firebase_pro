import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class utils{
    void toastmassege(String massege){
      Fluttertoast.showToast(
        msg: massege,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
    );
    }
}