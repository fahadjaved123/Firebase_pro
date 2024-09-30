import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart';

void main (){
  return runApp(my_app());
}
class my_app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: '',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      useMaterial3:  false,
      textTheme: TextTheme(
       headlineSmall:TextStyle(fontSize: 20,fontFamily: 'Pts'),
      )
    ),
    home: MyHomePage(title:'BMI calculator '),
    );
  }
}
class MyHomePage extends StatefulWidget{
  final String title;
  MyHomePage({Key? key,required this.title}):super(key: key);
State<MyHomePage> createState()=>_MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  var wtc=TextEditingController();
  var Hin=TextEditingController();
  var Hif=TextEditingController();
  var reset='';
  var bgColor;
 @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text(widget.title),
    ),
    body: Container(
      color: bgColor,
      child: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('BMI',style: TextStyle(fontSize: 35,
              fontWeight: FontWeight.bold,fontFamily: 'fonts'),),
              SizedBox(height: 10,),
              TextField(
                controller:wtc ,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your weight(in kg)',
                  style: Theme.of(context).textTheme.headlineSmall),
                  prefixIcon: Icon(Icons.line_weight), 
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                controller: Hif,
                decoration: InputDecoration(
                  label: Text('Enter your Height (in Feet)',
                  style: Theme.of(context).textTheme.headlineSmall),
                  prefixIcon: Icon(Icons.height),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: Hin,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter your Height(In Inches)',
                  style: Theme.of(context).textTheme.headlineSmall),
                  prefixIcon: Icon(Icons.height_outlined),
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){
                var Wt=wtc.text.toString();
                var ft=Hif.text.toString();
                var inche=Hin.text.toString();
                if(Wt!='' && ft!='' && inche!=''){
                  var iwt=int.parse(Wt);
                  var ift=int.parse(ft);
                  var Iinche=int.parse(inche);
                  var tinch=(ift*12)+Iinche;
                  var tcm=tinch*2.54;
                  var tm=tcm/100;
                  var bmi=iwt/(tm*tm);
                  var msg='';
                  if(bmi>25){
                    msg='Your are overweight!!';
                    bgColor=Colors.orange.shade200;
                  }
                  else if(bmi<18){
                    msg='Your are under weight!!';
                    bgColor=Colors.red.shade200;
                  }
                  else{
                    msg='Your are healthy';
                    bgColor=Colors.green.shade200;
                  }
                  setState(() {
                    reset='$msg \n Your BMI is equal to ${bmi.toStringAsFixed(2)}';
                  });
                }
                else{
                  setState(() {
                  reset='Please full all requried blanks!!';
                });
                }
                
              }, child: Text('Calculate')),
              SizedBox(height: 12,),
              Text('$reset',style: TextStyle(fontSize: 20,fontFamily: 'Pts'),),
            ],
          ),
        ),
      ),
    ),
  );
  }
}