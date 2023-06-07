import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/firebase_options.dart';
import 'package:tiktok_clone/view/screen/auth/login_Screen.dart';
import 'package:tiktok_clone/view/screen/auth/signup_screen.dart';




void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok Clone',
      theme:  ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home:SignUpScreen(),
    );
  }
}

