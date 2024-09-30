import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:my_app/projects/ToItem.dart';
import 'package:my_app/projects/mytodolist.dart';
import 'package:my_app/projects/tod.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(
     MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => todolistmodel()),
      ],
      child: my_app(),
     )
  );
}
class my_app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor:Colors.transparent ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add New Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: false,
      ),
      home: Home(title: 'Add New Task',)
    );
  }
}
class Home extends StatefulWidget{
  final String title;
  Home({Key? key,required this.title}):super(key: key);

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
   TextEditingController _datecon = TextEditingController();
   TextEditingController _timecon=TextEditingController();
   TextEditingController textcon=TextEditingController();
    String selectime='';
  String selectdate ='';
  
  List icon=<IconData>[
    Icons.school,
    Icons.favorite,
    Icons.home,
    Icons.calendar_month,
    Icons.person,
  ];
   List<bool> isTrue=List.generate(5,(index)=>false);
  Future<void> _setdate(BuildContext context)async{
    DateTime? pickedate=await showDatePicker(
      context: context,
       firstDate: DateTime(2000),
        lastDate: DateTime(2025));
        if(pickedate!=null){
          final formatdate=DateFormat('yMMMMd').format(pickedate);
         setState(() {
           selectdate=formatdate;
           _datecon.text=formatdate;
         });
        }
  }
  Future<void>_selectime(BuildContext context)async{
    TimeOfDay?pickedtime=await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now());
      if(pickedtime!=null){
        final now=DateTime.now();
        final formatime=DateFormat('hh:mm a').format(
          DateTime(now.year,now.day,now.hour  ,
              pickedtime.hour,pickedtime.minute),
          
        );
        setState(() {
          selectime=formatime;
          _timecon.text=selectime;
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    final todoListModel = Provider.of<todolistmodel>(context).todolist;
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0,left: 20.0),
              child: Container(
              child: Text('Task Title',
              style: TextStyle(fontFamily: 'fonts',fontSize: 20,
              fontWeight:FontWeight.bold),)),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top: 15),
              child: TextField(
                controller: textcon,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )
                  )
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 25),
                  child: Container(
                    child: Text('Category',
                    style: TextStyle(fontFamily: 'fonts',
                    fontSize: 20,fontWeight: FontWeight.bold),)),
                ),
                // SCHOOL ICON
                  Padding(
                padding: const EdgeInsets.only(top:20,left: 7.0 ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                   color:  isTrue[0]? Colors.grey:Colors.grey.shade300,
                    
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue[0]=!isTrue[0];
                      });                      
                    },
                    child: Icon(icon[0], color: isTrue[0]? Colors.grey.shade700:Colors.grey,),
                    
                ),
              )
    ),
    // FAVOURIT ICON
                SizedBox(width: 7.0,),
                Padding(
                padding: const EdgeInsets.only(top:20,left: 5.0 ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color:isTrue[1]? Colors.orange.shade300:Colors.orange.shade200,
                    border: Border.all(
                      color: Colors.orange
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue[1]=!isTrue[1];
                      });
                    },
                    child: Icon(Icons.favorite,color:isTrue[1]? Colors.orange.shade700:Colors.orange.shade500,)),
                ),
              ),
              // HOME ICON
                SizedBox(width: 5.0,),
                Padding(
                padding: const EdgeInsets.only(top:20,left: 5.0 ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isTrue[2]? Colors.green.shade300:Colors.green.shade200,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: () {
                      isTrue[2]=!isTrue[2];
                      setState(() {
                        
                      });
                    },
                    child: Icon(Icons.home,color: isTrue[2]? Colors.green.shade800:Colors.green.shade500,)),
                ),
              ),
              // CALENDER ICON
                SizedBox(width: 5.0,),
                 Padding(
                padding: const EdgeInsets.only(top:20,left: 5.0 ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isTrue[3]? Colors.blue.shade300:Colors.blue.shade200,
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: () {
                      isTrue[3]=!isTrue[3];
                      setState(() {
                        
                      });
                    },
                    child: Icon(Icons.calendar_month,color: isTrue[3]? Colors.blue.shade800:Colors.blue.shade500,)),
                ),
              ),
                SizedBox(width: 5.0,),
                // PERSON ICON
                Padding(
                padding: const EdgeInsets.only(top:20,left: 5.0 ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isTrue[4]? Colors.indigo.shade300:Colors.indigo.shade200,
                    border: Border.all(
                      color: Colors.indigo,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue[4]=!isTrue[4];
                      });
                    },
                    child: Icon(Icons.person,color:
                    isTrue[4]? Colors.indigo.shade800:Colors.indigo.shade500,)),
                ),
              ),
              ],
            ),
            // date
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                    padding: const EdgeInsets.only(top: 30,left: 20),
                    child: Container(
                      child: Text('Date',style: TextStyle(fontFamily: 'fonts',
                      fontSize: 20,fontWeight: FontWeight.bold),),
                      
                      ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.only(left: 20.0,top: 15.0),
                    child: TextField(
                      onTap: () {
                        _setdate(context);
                      },
                      readOnly: true,
                      controller: _datecon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      )
                    )
                  ),
                    ),
                  ),
                  
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                    padding: const EdgeInsets.only(top: 30,left: 15,),
                    child: Container(
                      // padding: EdgeInsets.only(),
                      child: Text('Time',style: TextStyle(fontFamily: 'fonts',
                      fontSize: 20,fontWeight: FontWeight.bold),),
                      
                      ),
                  ),
                  Container(
                    width: 200,
                    height: 100,
                    margin: EdgeInsets.only(left: 10.0,top: 15.0,right: 8.0),
                    child: TextField(
                      onTap: () {
                        _selectime(context);
                      },
                      controller: _timecon,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      )
                    )
                  ),
                    ),
                  ),
                  
                    ],
                  ),
                ),
              ]
            ),
            // note
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                child: Text('Note',style: TextStyle(fontFamily: 'fonts', 
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                ),),
                ),
            ),
               
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      )
                    ),
                  margin: EdgeInsets.only(left: 10,right: 10.0,top: 10.0),
                    child: TextField(
                     decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                     ),
                    ),
                  ),
                  // save button
                  Container(
                    margin: EdgeInsets.only(left: 20,top: 5.0),
                    width: 350,
                    child: ElevatedButton(
                      onPressed:() {
                        if(textcon.text.isNotEmpty){

                        
                        final todoo = todO(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  text: textcon.text,icon: _selectedIcon ,time: _timecon.text,
                );
                        
                Provider.of<todolistmodel>(context, listen: false).addtodo(todoo);
                        }
                        Navigator.push(
                          context,MaterialPageRoute(
                            builder: (context)=>Mytodo()));
                            
                      }, 
                      child: Text('Save',style: TextStyle(fontFamily: 'fonts',
                      fontSize: 15,
                      ),),
                      style: ElevatedButton.styleFrom(
                        
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: Colors.purpleAccent,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside,
                            style: BorderStyle.solid,
                          )
                        )
                      ),
                      ),
                  ) ,

          ],
        ),
      ),
    );
  }
}IconData _selectedIcon=Icons.school;

// class school extends StatefulWidget{
//   @override
//   State<school> createState() => _schoolState();
// }

// class _schoolState extends State<school> {
//   bool istrue=false;
//   @override
//   Widget build(BuildContext context) {
    
//     return Padding(
//                 padding: const EdgeInsets.only(top:20,left: 7.0 ),
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                    color:  istrue? Colors.grey.shade400:Colors.grey,
                    
//                     borderRadius: BorderRadius.circular(25),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black,
//                         blurRadius: 2.0,
//                         blurStyle: BlurStyle.outer,
//                       )
//                     ]
//                   ),
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         istrue=!istrue;
//                       });                      
//                     },
//                     child: Icon(_selectedIcon, color: istrue? Colors.grey:Colors.grey.shade700,),
                    
//                 ),
//               )
//     );
//   }
// }
// class favourt extends StatefulWidget{
//   @override
//   State<favourt> createState() => _favourtState();
// }

// class _favourtState extends State<favourt> {
//   bool istrue=false;

//   @override
//   Widget build(BuildContext context) {
//    return Padding(
//                 padding: const EdgeInsets.only(top:20,left: 5.0 ),
//                 child: Container(
//                   width: 40,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color:istrue? Colors.orange.shade200:Colors.orange.shade300,
//                     border: Border.all(
//                       color: Colors.orange
//                     ),
//                     borderRadius: BorderRadius.circular(25),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black,
//                         blurRadius: 2.0,
//                         blurStyle: BlurStyle.outer,
//                       )
//                     ]
//                   ),
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         istrue=!istrue;
//                       });
//                     },
//                     child: Icon(Icons.favorite,color:istrue? Colors.orange.shade500:Colors.orange.shade700,)),
//                 ),
//               );
//   }
// }
class home extends StatefulWidget{
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool istrue=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(top:20,left: 5.0 ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: istrue? Colors.green.shade200:Colors.green.shade300,
                    border: Border.all(
                      color: Colors.green,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ]
                  ),
                  child: InkWell(
                    onTap: () {
                      istrue=!istrue;
                      setState(() {
                        
                      });
                    },
                    child: Icon(Icons.home,color: istrue? Colors.green.shade500:Colors.green.shade800,)),
                ),
              );
  }
}
class clander extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(top:20,left: 5.0 ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ]
                  ),
                  child: Icon(Icons.calendar_month,color: Colors.blue.shade500,),
                ),
              );
  }
}
class person extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(top:20,left: 5.0 ),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade200,
                    border: Border.all(
                      color: Colors.indigo,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 2.0,
                        blurStyle: BlurStyle.outer,
                      )
                    ]
                  ),
                  child: Icon(Icons.person,color: Colors.indigo.shade500,),
                ),
              );
  }
}