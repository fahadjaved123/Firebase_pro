import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main()
{
  return runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      
      title: 'crud operations',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: false,
        
      ),
      home: MyHomePage(title: 'Producting Listing',),
    );
  }
}
class MyHomePage extends StatelessWidget{
  final String title;
  
  MyHomePage({Key? key,required this.title}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: [
          productbox(
            name: 'Iphone',
            description: 'Iphone is expensive phone',
            price: '100000',
            image: 'assests/images/samsong.jpg',
          ),
          productbox(
            name: 'Laptop',
            description: ' Laptop is most productive development tool',
            price: '60000',
            image: 'assests/images/laptop.jpg',
          ),
          productbox(
            name: 'Tablet',
            description: 'Tablet is most usefull device',
            price: '50000',
            image: 'assests/images/tablet.jpg',
          ),
          productbox(
            name: 'Pendrive',
            description: 'Pendrive is usefull for data sharing',
            price: '1500',
            image: 'assests/images/pendrive.jpg',
          ),
          productbox(
            name: 'Samsong',
            description: 'Samsong is compititive of Iphone ',
            price: '90000',
            image: 'assests/images/tablet.jpg',
          ),
          productbox(
            name: 'Pc',
            description: 'Pc is most usefull device',
            image: 'assests/images/pc.jpg',
            price: '20000',
          ),
        ],
      )
    );
  }
}
class productbox extends StatelessWidget{
  productbox({Key? key,this.name,this.description,this.price,this.image}):super(key: key);
  final String? name;
  final String? description;
  final String? price;
  final String? image; 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               Image.asset(image!,height: 100,width: 100,),
              Expanded(
                child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(margin:EdgeInsets.all(9),
                     child:  Text(this.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'play'),)),
                      Text(this.description!,style: TextStyle(fontSize: 15,fontFamily: 'fonts'),),
                      Text('price'+this.price!),
                      
                    ],
                  ),
                )
                
            ],
          ),
        ),
      ),
    );
  }

}