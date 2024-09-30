import 'package:flutter/cupertino.dart';

class todO{
  String? text;
  String? id;
  bool isdone;
  final IconData? icon;
  var time;
  todO({
    required this.id,required this.text, this.isdone=false, this.icon,this.time
      });
}
//   static List<todO> todOlist(){
//     return [
//       todO(id: '1', text: 'Morining Walk',isdone: true),
//       todO(id: '2', text: 'Handle Errors',isdone: true),
//       todO(id: '3', text: 'Working On Projects',),
//       todO(id: '4', text: 'See The Error In Projects',),
//     ];
//   }
// }
