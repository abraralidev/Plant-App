import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantapp/Screens/Splash_Screen/splash_screen.dart';

///
import '../bindings/all_bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        bottomAppBarColor: Colors.green,
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Plant Mobile App UI Design',
      initialBinding: MyBindings(),
      home: const SplashScreen(),
    );
  }
}
