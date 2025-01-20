import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:notifydoc_b1/firebase_options.dart';
import 'package:notifydoc_b1/src/services/notification_api.dart';
import 'package:notifydoc_b1/src/ui/home/homeScreen.dart';
import 'package:notifydoc_b1/src/ui/login_ui/login_ui.dart';
import 'package:notifydoc_b1/src/utils/route.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialNotification();
  await initializeDateFormatting();
  await Firebase.initializeApp( 
    options: DefaultFirebaseOptions.currentPlatform, 
  );
  await GetStorage.init();     
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(      
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      routes: route,  
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          return  HomeScreen(); 
        } else {
          return LoginUi();
        }
      },
    ));
  }
}
