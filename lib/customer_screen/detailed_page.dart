
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../services/database.dart';
import '../services/shared_preferences.dart';
import 'cust_booked_details.dart';
import 'onboadring.dart';


class ProductDetailsPage extends StatefulWidget {
  String productId;
  String Name;
  String Email;
  String Mobile;
  String Address;


  ProductDetailsPage({
    required this.productId,
    required this.Name,
    required this.Email,
    required this.Mobile,
    required this.Address,
  });

  _ProductDetailsPageState createState() => _ProductDetailsPageState();

}
class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String? name,image,address,email,mobile,adminName;
  String? salonname;
  getDatafromSharedPref() async {
    adminName= await SharedprefHelper().getAdminName();
    image= await SharedprefHelper().getAdminImage();
    email=await SharedprefHelper().getUserEmail();
    mobile=await SharedprefHelper().getUserMobileNumber();
    salonname= await SharedprefHelper().getAdminSalonName();
    name=await SharedprefHelper().getUserName();
    address=await SharedprefHelper().getAdminAddress();
    setState(() {
    });
  }
  getOntheLoad() async{
    await getDatafromSharedPref();
    setState(() {

    });
  }
final List<String> serviceList=[
  "Stylish Hair-cut",
  "Head Massage",
  "Face Wash",
  "Hair Wash",
  "Colors on Hairs",
  "Kids Spacial",
  "Salon Spacial "
];
  String isSelected="Stylish Hair-cut";
  @override
  void initState() {
    getOntheLoad();

    super.initState();
  }
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xff715901),
      body:
      SingleChildScrollView(
        child: Column(
        children: [
          Center(
            //padding: EdgeInsets.all(08.0),
            child:
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance.collection('Admin').doc(
                  widget.productId).get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
          
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Center(child: Text('Data Not found.'));
                }
          
                var productData = snapshot.data!;
                return SingleChildScrollView(
                    child:
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 05),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Image.network(productData["Image"],
                                  fit: BoxFit.cover,),
                              ),
                              SizedBox(height: 05),
                              Center(
                                child: Text(
                                  widget.Name,
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold,
                                    color:Colors.white),
                                ),
                              ),
                              SizedBox(height: 05),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text("Open: 09:00AM", style: TextStyle(
                                         fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      color:Colors.white,
                                    ),),
                                    SizedBox(width: 15,),
                                    Text("Closed: 10:00PM", style: TextStyle(
                                        color:Colors.white, fontSize: 12,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ],
                                ),
                              ),
                              SizedBox(height: 05,),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.email, size: 15,
                                      color: Colors.white,),
                                    SizedBox(width: 05),
                                    Text(
                                      widget.Email,
                                      style: TextStyle(fontSize: 12,
                                          color:Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 05),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.call, size: 15,
                                      color: Colors.white,),
                                    SizedBox(width: 05),
                                    Text(
                                      productData["Mobile"],
                                      style: TextStyle(fontSize: 12,
                                          color:Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 05),
                              Center(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Address:", style: TextStyle(fontSize: 12,
                                          color:Colors.white),),
                                      SizedBox(width: 05),
                                      Text(
                                        widget.Address,
                                        style: TextStyle(fontSize: 12,
                                            color:Colors.white),
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
              },
            ),
          ),
          Divider(),
          Text("Select Services",style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),), DropdownButton(
              value: isSelected,

              items: serviceList.map((item)=>DropdownMenuItem<String>(
                  value: item,

                  child: Text(item,style: TextStyle(fontSize: 12,
                  color: Colors.black),))).toList(),
              onChanged: (item){
                setState(() {
                  isSelected=item!;
                });
              }),
          Divider(),
          SizedBox(height: 10,),
          Text("Select Date",style: TextStyle(
              color:Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),),
          GestureDetector(
            onTap: (){
              _selectedDate(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month,color: Colors.white,size: 25,),
                SizedBox(width: 10,),
                Text("${_selectDateTime.day}/${_selectDateTime.month}/${_selectDateTime.year}",
                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
              ],
            ),
          ),
          Divider(),
          Text("Available Time Slot",
            style: TextStyle(
              fontWeight: FontWeight.bold,
                color:Colors.white,
              fontSize: 15
            ),
          ),
          Container(
            height: 320,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child:
            Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        one=true;
                        two=false;
                        tree=false;
                        four=false;
                        five=false;
                        six=false;
                        seven=false;
                        eight=false;
                        setState(() {
        
                        });
                      },
                      child:  Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: one ? Colors.green:Colors.teal
                        ),
                        child: Text("01:00PM",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        one=false;
                        two=true;
                        tree=false;
                        four=false;
                        five=false;
                        six=false;
                        seven=false;
                        eight=false;
                        setState(() {
        
                        });
                      },
                      child:  Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: two ? Colors.green:Colors.teal,
                        ),
                        child: Text("02:00PM",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        one=false;
                        two=false;
                        tree=true;
                        four=false;
                        five=false;
                        six=false;
                        seven=false;
                        eight=false;
                        setState(() {
        
                        });
                      },
                      child:  Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: tree ? Colors.green:Colors.teal,
                        ),
                        child: Text("03:00PM",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        one=false;
                        two=false;
                        tree=false;
                        four=true;
                        five=false;
                        six=false;
                        seven=false;
                        eight=false;
                        setState(() {
        
                        });
                      },
                      child:  Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: four ? Colors.green:Colors.teal,
                        ),
                        child: Text("04:00PM",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        one=false;
                        two=false;
                        tree=false;
                        four=false;
                        five=true;
                        six=false;
                        seven=false;
                        eight=false;
                        setState(() {
        
                        });
                      },
                      child:  Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: five ? Colors.green:Colors.teal,
                        ),
                        child: Text("05:00PM",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        one=false;
                        two=false;
                        tree=false;
                        four=false;
                        five=false;
                        six=true;
                        seven=false;
                        eight=false;
                        setState(() {
        
                        });
                      },
                      child:  Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: six?Colors.green:Colors.teal,
                        ),
                        child: Text("06:00PM",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        one=false;
                        two=false;
                        tree=false;
                        four=false;
                        five=false;
                        six=false;
                        seven=true;
                        eight=false;
                        setState(() {
        
                        });
                      },
                      child:  Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: seven ? Colors.green:Colors.teal,
                        ),
                        child: Text("07:00PM",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        one=false;
                        two=false;
                        tree=false;
                        four=false;
                        five=false;
                        six=false;
                        seven=false;
                        eight=true;
                        setState(() {
        
                        });
                      },
                      child:  Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: eight ? Colors.green:Colors.teal,
                        ),
                        child: Text("08:00PM",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: ()async {
                    getBooking(name.toString());
                  },
                  child:Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Book Now",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff715901)
                    ),),
                  ),
                ),
              ],
            ),
          )
        ],
            ),
      ),);
  }
  DateTime _selectDateTime=DateTime.now();

  Future<void>_selectedDate(BuildContext context)async {

    DateTime? _picked=await showDatePicker(
        context: context,
        firstDate: DateTime(2025),
        lastDate: DateTime(2026));
    if(_picked!=null && _picked!=_selectDateTime){
      setState(() {
        _selectDateTime=_picked;
      });
    }
  }
  bool one = false;
  bool two = false;
  bool tree = false;
  bool four = false;
  bool five = false;
  bool six = false;
  bool seven = false;
  bool eight = false;
  int track = 0;

  List<String> getFormatedDates() {
    final now = DateTime.now();
    final formatter = DateFormat("EEE d");
    return List.generate(10, (index) {
      final date = now.add(Duration(days: index));
      return formatter.format(date);
    });
  }

  String? currentDate;

  getBooking(String id) async {
    Map<String, dynamic>userBooking = {
      "UserName":name,
      "UserEmail":email,
      "UserMobile":mobile,
      "Salon":widget.Name,
      "Services":isSelected,
      "Mobile":widget.Mobile,
      "Email":widget.Email,
      "Address":widget.Address,
      "Date": "${_selectDateTime.day}/${_selectDateTime.month}/${_selectDateTime.year}",
      "Time": one ? "01:00PM" : two ? "02:00PM" :
      tree ? "03:00PM" : four ? "04:00PM" :
      five ? "05:00PM" : six ? "06:00PM" :
      seven ? "07:00PM" : "08:00PM"
    };
    await MyDatabase().addUserBooking(userBooking).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Booked Successfully")));
      //Navigator.push(context,MaterialPageRoute
      //  (builder: (context)=>CustBookedPage()));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBookingScreen()));
    });
  }
}





