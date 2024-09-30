
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/projects/tod.dart';
import 'package:intl/intl.dart';

class todolistmodel extends ChangeNotifier{
  List<todO>todolist=[
    todO(id: '1', text: 'Morining Walk',isdone: true,
    icon: Icons.person,time:DateFormat('hh:mm a').format(DateTime.now())  ),
      todO(id: '2', text: 'Handle Errors',isdone: true,
      icon:  Icons.favorite,time: DateFormat('hh:mm a').format(DateTime.now())),
      todO(id: '3', text: 'Working On Projects',icon:  Icons.favorite,time: '8:40 pm'),
      todO(id: '4', text: 'See The Error In Projects',icon:  Icons.school,time: '10:20 AM'),
  ];
  void addtodo(todO todoo){
    todolist.add(todoo);
    
  }
 
}