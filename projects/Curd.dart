// void main(){
//   return runApp(my_app());
// }
import 'package:flutter/material.dart';
void main(){
  return runApp(MyWidget());
}
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Icon(
        Icons.favorite,
        color: isSelected ? Colors.red : Colors.grey,
      ),
    );
  }
}
