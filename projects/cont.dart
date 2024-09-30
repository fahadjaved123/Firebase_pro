// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:my_app/main.dart';
// import 'package:my_app/new.dart';


// class Contact{
//   String Name;
//   String contact;
//   Contact({required this.Name,required this.contact});
// }
// class productBox extends StatelessWidget{
//   productBox({Key? key,this.description,this.name,this.price,this.image}):super(key: key);
//   final String? name;
//   final String? description;
//   final int? price;
//   final String? image;
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//         padding: EdgeInsets.all(2),
//           height: 170,
          
//           child: SizedBox(
//             height: 140,
//             child: Card(
//               elevation: 5,
//               shadowColor: const Color.fromARGB(255, 201, 190, 190),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Image.asset('assest/images/'+image!,height: 100,),
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.all(9),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(this.name!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//                           Text(this.description!),
//                           Text('price:'+this.price.toString()),
//                           RatingBox(),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//   }
// }
// class RatingBox extends StatefulWidget{
//   _RatingBoxstate createState()=>_RatingBoxstate();
// }
// class _RatingBoxstate extends State<RatingBox>{
//   int _rating=0;
//   void _setRatingone(){
//     setState(() {
//       _rating=1;
      
//     });
//   }
//   void _setRatingtwo(){
//     setState(() {
//       _rating=2;
//     });
//   }
//   void _setRatingthree(){
//     setState(() {
//       _rating=3;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     double _size=20;
//     print(_rating);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(0),
//           child: Container(
//             child: IconButton(icon: (_rating >=1? Icon(Icons.star,size: _size,):Icon(Icons.star_border,size: _size,)),
//             color: const Color.fromARGB(255, 31, 25, 24),
//             onPressed: _setRatingone,
//             iconSize: _size,
//             ),
//           ),
//         ),
//          Padding(
//           padding: const EdgeInsets.all(0),
//           child: Container(
//             child: IconButton(icon: (_rating >=2? Icon(Icons.star,size: _size,):Icon(Icons.star_border,size: _size,)),
//             color: Colors.red[500],
//             onPressed: _setRatingtwo,
//             iconSize: _size,
//             ),
//           ),
//         ),
//          Padding(
//           padding: const EdgeInsets.all(0),
//           child: Container(
//             child: IconButton(icon: (_rating >=3? Icon(Icons.star,size: _size,):Icon(Icons.star_border,size: _size,)),
//             color: Color.fromARGB(255, 105, 236, 17),
//             onPressed: _setRatingthree,
//             iconSize: _size,
//             ),
//           ),
//         ),
        
//       ],
//     );
//   }
// }
// class Intro extends StatelessWidget{
// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Intro'),
//       ),
//       body: Column(
//         children: [
//           Text('Welcome '),
//           SizedBox(height: 60,),
//           ElevatedButton(onPressed: (){
//             Navigator.pop(context, 'hello to second screen');
//           }, child: Text('Back')),
//         ],
//       ),
//     );
//   }
// }