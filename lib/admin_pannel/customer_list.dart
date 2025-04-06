import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salonapp/services/shared_preferences.dart';

class MyCustList extends StatefulWidget{
  @override
  _MyCustListState createState()=>_MyCustListState();

}


class _MyCustListState extends State<MyCustList>{
  CollectionReference reference=FirebaseFirestore.instance.collection("users");
  Stream? _streamCustomers;
  String? mobileno;
  getCustData()async{
    mobileno=await SharedprefHelper().getUserMobileNumber();
    setState(() {

    });
  }

  getOntheLoad()async{
   await getCustData();
   setState(() {

   });
  }

  initState(){
    super.initState();
    getOntheLoad();
  }
  @override
  Widget build(BuildContext context) {
    reference.get();

    // TODO: implement build
   // throw UnimplementedError();
    return
        Scaffold(
   body: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection("users").snapshots(),
    builder:(BuildContext context, AsyncSnapshot snapshot){
      if(snapshot.hasError){
        return Center(child: Text(snapshot.error.toString()));
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        return
          Center(child: CircularProgressIndicator());
      }
      if(snapshot.hasData){
        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              var  ds= snapshot.data!.docs[index];

          return
               Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff1a2402),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child:
                  Expanded(
                    flex: 1,
                    child:
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Text("Id: "+ds["Id"]),
                          Text(ds["Name"],style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 10
                          ),),
                          Text(ds["Mobile"],style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                              fontSize: 10
                          ),),
                          Text(ds["Email"],style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                              fontSize: 10
                          ),),
                         // Text("Image: "+ds["Image"]),
                        ],
                        ),
                  ),
              );


        });
      }
      return Container();
     }),
        );
  }

}