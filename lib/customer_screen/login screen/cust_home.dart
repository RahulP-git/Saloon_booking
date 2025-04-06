import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../detailed_page.dart';

class HomeScreen extends StatefulWidget {
  String userId;
  HomeScreen({required this.userId});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
  class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: Color(0xff715901),
      body: 
      SingleChildScrollView(
        child: 
        Column(
          children: [
            SizedBox(height: 10,),
            Text("Welcome "+ widget.userId,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,color: Colors.white,
            ),),
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                 stream: FirebaseFirestore.instance.collection('Admin').snapshots(),
                 builder: (context, snapshot) {
                   if (snapshot.connectionState == ConnectionState.waiting) {
                     return Center(child: CircularProgressIndicator());
                   }
                   if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                     return Center(child: Text('No Data available.'));
                   }
            
                   var products = snapshot.data!.docs;
                   return
                     ListView.builder(
                     itemCount: products.length,
                     itemBuilder: (context, index) {
                       var product = products[index];
                       String Name = product['Name'];
                       var Image = product['Image'];
                       String Email = product['Email'];
                       String Mobile = product['Mobile'];
                       String Address = product['Address'];
                       return
                         InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsPage(
                               productId: product.id,
                               Name: Name,
                               Email: Email,
                               Mobile:Mobile,
                               Address: Address,
                             )));
                           },
                           child: Container(
                             padding:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                             margin:EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                             alignment: Alignment.center,
                             //height: 300,
                             width: MediaQuery.of(context).size.width,
                             decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(10)
                             ),
                             child:
                             Row(
                               children: [
                                  // Image.network(Image),
                                 SizedBox(width: 10,),
                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Text(Name,style: TextStyle(
                                       fontSize: 15,color: Color(0xff715901),
                                       fontWeight: FontWeight.bold,
                                     ),),
                                     Text("Ratings:*****",style: TextStyle(
                                       fontSize: 12,color: Color(0xff715901),
                                       fontWeight: FontWeight.bold,
                                     ),),
                                     Text(Email,style: TextStyle(
                                       fontSize: 12,color: Color(0xff715901),
                                       fontWeight: FontWeight.bold,
                                     ),),
                                     Text(Address,style: TextStyle(
                                       fontSize: 12,color: Color(0xff715901),
                                       fontWeight: FontWeight.bold,
                                     ),),
                                     Text(Mobile,style: TextStyle(
                                         fontSize: 12,
                                         fontWeight: FontWeight.bold,
                                         color: Color(0xff715901),
                                     ),),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         );
                     },
                     );
                 },
               ),
            )
          ],
        ),
      ),
    );
  }
}
