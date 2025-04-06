import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void>firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  await NotificationService.instance.setupMessegeHandlers();
  await NotificationService.instance.showNotification(message);
}
class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();
  final messaging = FirebaseMessaging.instance;
  final localNotifications = FlutterLocalNotificationsPlugin();
  bool isLocalNotificationsInitialized = false;

  Future<void>initialize()async{
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    //request permission
    await _requestPermissions();
    //setup message handler
    await setupMessegeHandlers();

    final token=await messaging.getToken();
    print("FCM Token:$token");
  }

  Future<void> _requestPermissions() async {
    final settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
        announcement: false,
        carPlay: false,
        criticalAlert: false
    );
    print("Permission Status:${settings.authorizationStatus}");
  }

  Future<void> setupFlutterNotifications() async {
    if (isLocalNotificationsInitialized) {
      return;
    }

    //Android Setup
    const channel = AndroidNotificationChannel(
        "High_Importance_channel",
        "High_Importance_Notifications",
        description: "This channel use for Important Notifications",
        importance: Importance.high);


    await localNotifications.resolvePlatformSpecificImplementation
    <AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(
        channel);
    const initializationSettingsAndroid =
    AndroidInitializationSettings("My Notifications");

    //IOs Setup

    final initializationSettingsDriwn = DarwinInitializationSettings(
        // onDidReceiveLocalNotification: (id, title, body, payload) async {
        // }
    );

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDriwn,
    );

    //flutter notifications
    await localNotifications.initialize(
        initializationSettings,
    onDidReceiveNotificationResponse:(detail){

    });
    isLocalNotificationsInitialized =true;
  }

  Future<void> showNotification(RemoteMessage message)async{
    RemoteNotification? notification=message.notification;
    AndroidNotification? android=message.notification?.android;
    if(notification!=null && android!=null){
      await localNotifications.show(
        notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android:AndroidNotificationDetails(
                "High Importance Channel",
                "High Importance Notification",
            channelDescription: "This channel use for Important notifications",
            importance: Importance.high,
            priority: Priority.high,
            icon: "High"),
            iOS:const DarwinNotificationDetails(
               presentAlert: true,
               presentBadge: true,
               presentSound: true,
            )
          ),
        payload: message.data.toString(),
      );
    }
  }
  Future<void>setupMessegeHandlers()async {
    //foreground message,
    FirebaseMessaging.onMessage.listen((message) {
      showNotification(message);
    });

    //Background Message
    FirebaseMessaging.onMessageOpenedApp.listen(_handlBackgroundMessage);

    //opened App
    final initialMessage=await messaging.getInitialMessage();
    if(initialMessage!=null){
      _handlBackgroundMessage(initialMessage);
    }
  }

 void _handlBackgroundMessage(RemoteMessage message){
    if(message.data['type']=='chat'){
      //open chat screen,
    }

 }

}



