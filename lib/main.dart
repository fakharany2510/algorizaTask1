import 'package:algoriza_intern_task1/modules/login_screen.dart';
import 'package:algoriza_intern_task1/modules/on_boarding.dart';
import 'package:algoriza_intern_task1/modules/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=> OnBoardingScreen(),
        'login':(context)=>LoginScreen(),
        'register':(context)=>RegisterScreen(),
      },
    );
  }
}

