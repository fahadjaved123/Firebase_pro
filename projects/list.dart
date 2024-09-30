import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main(){
  return runApp(my_app());
}
class my_app extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
      ),
      home: MyHomePage(title: '',),
    );
  }
}
class MyHomePage extends StatefulWidget{
  final String title;
  MyHomePage({Key? key,required this.title}):super(key: key);
State<MyHomePage> createState()=>_MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  final TextEditingController text=TextEditingController();
   final List<String> items = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 2,
                        )
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(onPressed: (){
                  setState(() {
                    
                items.add(text.text);
                  });
                
                },child: Icon(Icons.add),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                ),
              )
            ],
          ),
          SizedBox(width: 10,),
           Expanded(
             child: ListView.builder(itemBuilder:(context, index) {
                return ListTile(
                  leading: Text(items[index]),
                  subtitle: Text(text.toString()),
                );
              },),
           ),
          
        ],
      )
    );
  }
}