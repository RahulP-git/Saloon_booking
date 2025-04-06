import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonapp/customer_screen/login%20screen/cust_login_page.dart';
import 'package:salonapp/services/flutter_provider.dart';
import 'package:salonapp/services/google_home_screen.dart';
import 'package:salonapp/services/notifications.dart';
import 'admin_pannel/adminloginscreen/admin_booking_page.dart';
import 'admin_pannel/adminloginscreen/admin_home_page.dart';
import 'admin_pannel/adminloginscreen/admin_login_page.dart';
import 'admin_pannel/adminloginscreen/admin_signup_page.dart';
import 'admin_pannel/customer_list.dart';
import 'customer_screen/booking_slote.dart';
import 'customer_screen/cust_booked_details.dart';
import 'customer_screen/customer_home_screen.dart';
import 'customer_screen/detailed_page.dart';
import 'customer_screen/details_screen.dart';
import 'customer_screen/login screen/cust_home.dart';
import 'customer_screen/login screen/cust_profile_page.dart';
import 'customer_screen/login screen/cust_salon_list.dart';
import 'customer_screen/login screen/cust_signup_page.dart';
import 'customer_screen/onboadring.dart';
import 'customer_screen/ratings.dart';


Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: "AIzaSyA0as7gvwu5kF9OksrWVf7_W1WPIjXXKYs",
    appId: "1:668164198285:web:c1b0a110afcabbb81377c4",
    messagingSenderId: "668164198285",
    projectId: "fir-salon-865d2",
));
  }
  // Initialize FFI for desktop environments
 // sqfliteFfiInit();
  //databaseFactory = databaseFactoryFfi;
  await Firebase.initializeApp();
 // await NotificationService.instance.initialize();
    //runApp(MySalon());
  runApp( ChangeNotifierProvider(
    create: (_)=>TimeSlotProvider(),child: MySalon(),)
  );
}

class MySalon extends StatefulWidget {
  _MySalonState createState() => _MySalonState();
}
class _MySalonState extends State<MySalon>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MySalon",
        theme: ThemeData.light(),
        home: Scaffold(
          body: LoginPage(),
        ),
    );
  }
}

