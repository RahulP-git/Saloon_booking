import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SaloonApprovalScreen extends StatefulWidget{
  String email;
  SaloonApprovalScreen({required this.email});
  @override
  _SaloonApprovalScreenState createState()=>_SaloonApprovalScreenState();

}

class _SaloonApprovalScreenState extends State<SaloonApprovalScreen>{
  final CollectionReference adminbookings =
  FirebaseFirestore.instance.collection('Salon');
  Future<void> updateBookingStatus(
      String bookingId, String status, String reason) async {
    await adminbookings.doc(bookingId).update({
      'ActivationStatus': status,
      'reason': reason,
    });
  }

  Future<void> showReasonDialog(BuildContext context, String bookingId, String status) {
    TextEditingController reasonController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: status == "Deactivate"
                ? Text('Enter Reason for $status')
                : Container(),
            content: TextField(
              controller: reasonController,
              decoration: InputDecoration(hintText: 'Reason'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  String reason = reasonController.text.trim();
                  if (reason.isNotEmpty) {
                    updateBookingStatus(bookingId, status, reason);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a reason')),
                    );
                  }
                },
                child: Text('Confirm'),
              ),
            ],
          )
          );
  }

  bool Deactivate=false;
  bool pending=true;
  bool Active=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    return Scaffold(
        appBar: AppBar(title: Text('Admin')),

        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          
                  SizedBox(width: 10,),
                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: (){
                        Active=true;
                        Deactivate=false;
                        pending=false;
                        setState((){});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:Active ? Colors.green:Colors.white,
                        ),
                        child: Text("Activated List"),
                      ),
                    ),
                  ),
          
                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child:GestureDetector(
                      onTap: () {
                        pending = true;
                        Active = false;
                        Deactivate = false;
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:pending?Colors.green: Colors.white,
                        ),
                        child: Text("Pending List"),
                      ),
                    ),
                  ),
          
                  Material(
                    elevation: 05,
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        pending = false;
                        Active = false;
                        Deactivate = true;
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color:Deactivate?Colors.green: Colors.white,
                        ),
                        child: Text("Deactivated List"),
                      ),
                    ),
                  )
                ],),
              SizedBox(height: 20,),
              StreamBuilder<QuerySnapshot>(
          
                stream:
                //adminbookings.where('ActivationStatus', isEqualTo: 'pending').snapshots(),
                pending? adminbookings.where('ActivationStatus', isEqualTo: 'pending').snapshots():
                Active ? adminbookings.where('ActivationStatus', isEqualTo: 'Active').snapshots():
                adminbookings.where('ActivationStatus', isEqualTo: 'Deactivate').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
          
                  if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No pending bookings.'));
                  }
          
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var registration = snapshot.data!.docs[index];
                      return Card(
                        elevation: 10,
                        margin:const EdgeInsets.all(20),
                        child: Container(
                          padding:const EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child:
                          Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1x204iMWzVwMBpRcZQOW5oSAy7XQyV8FTHg&s",
                                              fit: BoxFit.cover,)
                                        ),
                                        SizedBox(width: 07,),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 10,),
                                              Text(registration["SalonName"],style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),),
                                              SizedBox(width: 10,),
                                              Text(registration["Name"],style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                              ),),
                                              Row(
                                                children: [
                                                  Icon(Icons.mobile_friendly_rounded),
                                                  SizedBox(width: 05,),
                                                  Text("+91 "+registration["Mobile"],style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13,
                                                  ),),
                                                ],
                                              )
                                            ]),
                                        SizedBox(width: 10,),
                                        Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Email",style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),),
                                              SizedBox(width: 10,),
                                              Text(registration["Email"],style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),),
                                              SizedBox(width: 10,),
                                            ]),
                                        //SizedBox(width: 05,),
                                        Column(
                                            children: [
                                              Text("Status"),
                                            pending?  Column(
                                                children: [
                                                 Row(
                                                    children: [
                                                      IconButton(
                                                        tooltip: "Activate",
                                                        icon: Icon(Icons.check, color: Colors.green),
                                                        onPressed: () =>
                                                            showReasonDialog(context, registration.id, 'Active'),
                                                      ),
                                                      Text("Active")
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                        tooltip: "Deactive",
                                                        icon:  Icon(Icons.close, color: Colors.red,),
                                                        onPressed: () =>
                                                            showReasonDialog(context, registration.id, 'Deactive'),
                                                      ),
                                                      Text("Deactive")
                                                    ],
                                                  )
                                                ],
                                              ):
                                           Active? Row(
                                              children: [
                                                IconButton(
                                                  tooltip: "Activate",
                                                  icon:Active? Icon(Icons.check, color: Colors.green):Container(),
                                                  onPressed: () {}
                                                     // showReasonDialog(context, registration.id, 'Active'),
                                                ),
                                                Text("Active")
                                              ],
                                            ):
                                              Row(
                                                children: [
                                                  IconButton(
                                                    tooltip: "Deactive",
                                                    icon: Deactivate? Icon(Icons.close, color: Colors.red,):Container(),
                                                    onPressed: () {}
                                                       // showReasonDialog(context, registration.id, 'Deactivate'),
                                                  ),
                                                  Text("Deactive"),
                                                ],
                                              )
                                            ]
                                        )
                                      ]
                                  ),
                                SizedBox(height: 10,),
                                Text(registration["Address"],style:
                                TextStyle(color: Colors.black54,
                                    fontWeight: FontWeight.w600),)
                              ]),
          
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}