import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/projects/ToItem.dart';
import 'package:my_app/projects/main.dart';
import 'package:intl/intl.dart';
import 'package:my_app/projects/tod.dart';
import 'package:provider/provider.dart';

class Mytodo extends StatefulWidget{
  
  Mytodo({Key? key,}):super(key: key);

  @override
  State<Mytodo> createState() => _MytodoState();
}

class _MytodoState extends State<Mytodo> {
  final date=DateFormat('yMMMMd').format(DateTime.now());
  List<Color> color=[
Colors.grey.shade700,
Colors.green.shade600,
Colors.blue.shade600,
Colors.orange.shade500,
Colors.indigo.shade500,
  ];
    
  @override
  Widget build(BuildContext context) {
    final todoList = Provider.of<todolistmodel>(context).todolist;
    void _removeItem(int index) {
    setState(() {
      todoList.removeAt(index); // Remove the item at the specified index
    });
  }
    return Scaffold(
      body:  Stack(
        children: [
          // 1 
          Container(
            color: Colors.white,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200,right: 240,bottom: 20),
                child: Text('Completed',style: TextStyle(fontSize: 20,
                        decoration: TextDecoration.none,color: Colors.black,
                        fontFamily: 'fonts',fontWeight: FontWeight.normal,
                        ),),
              ),
            ),
          ),
          // 2
          Padding(
            padding: const EdgeInsets.only(bottom: 500),
            child: Container(
              color: Colors.purple,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Text('$date',style: TextStyle(fontSize: 20,
                      decoration: TextDecoration.none,color: Colors.white,
                      fontFamily: 'fonts',
                      ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Text('My Todo List ',style: TextStyle(fontSize: 30,
                        decoration: TextDecoration.none,color: Colors.white,shadows: [
                          Shadow(color: Color.fromARGB(255, 30, 214, 238),
                          blurRadius: 4,offset: Offset(2, 2)),
                        ]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.menu,color: Colors.white,),
                            Container(
                             
                              width: 50,
                              height: 50,
                              child: ClipRRect(
                                child: Image.asset('assests/images/avtar.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // 3
          Padding(
            padding: const EdgeInsets.only(top:170,bottom: 370,
            left: 20,right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    blurStyle: BlurStyle.outer,
                  ),
                  
                ]
              ),
              // child:ListView(
              //   children: [
              //   //  for(todO todoo in todolist)
              //   //  toDoitem(todoo: todoo,text: todoo.text.toString(),),
              //   ],
              // ),
              child: ListView.builder(
                
                itemCount: todoList.length,
                itemBuilder: (context ,index){
                  return ListTile(
                    leading: Icon(todoList[index].icon,color:color[index],),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todoList[index].text!.toUpperCase(),
                        style:TextStyle( decoration: todoList[index].isdone? 
                        TextDecoration.lineThrough:TextDecoration.none,fontFamily: 'fonts') ,),
                        Text(todoList[index].time.toString()),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {
                        setState(() {
                          todoList[index].isdone=!todoList[index].isdone;
                        });
                        
                      },
                      child: Icon(todoList[index].isdone? Icons.check_box:Icons.check_box_outline_blank,color: Colors.blue,)),
                  );
                }
                
                
                ),
            ),
          ),
          Padding(
            
            padding: const EdgeInsets.only(top: 500,
            bottom: 100,left: 20,right: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )
              ),
              child: 
                    ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context,index){
                      return todoList[index].isdone?
                      ListTile(
                      leading: Icon( todoList[index].icon,color: color[index],),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _removeItem(index);
                                });
                              },
                              child: Text(todoList[index].isdone? todoList[index].text!:"")),
                            Text(todoList[index].isdone? todoList[index].time.toString():''),
                          ],
                        ),
                        
                      ): SizedBox.shrink();
                    }
                    
                    ),
                    
                  ),
                ),
            
          
          Padding(
            padding: const EdgeInsets.only(top: 690,left: 30),
            child: Container(
              width: 330,
              child: ElevatedButton(
                onPressed:(){
                  Navigator.push(
                    context,MaterialPageRoute(
                      builder: (context)=>Home(title: 'Add New Task')) );
                } ,
                child:Text('Update',style: TextStyle(fontFamily: 'fonts',
                fontSize: 15,),) ,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(
                      width: 2,
                      color: Colors.purpleAccent,
                      style: BorderStyle.solid,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      
                    ),
                    
                  )
                ),
                ),
            ),
          ),
          
        ],
      ),
    );
  }
}