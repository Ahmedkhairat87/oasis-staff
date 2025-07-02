import 'package:flutter/material.dart';
import 'package:oasisstaff/core/app_style.dart';
import 'package:oasisstaff/logIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oasis Staff Application',
      theme: AppStyle.lightTheme,
      darkTheme: AppStyle.darkTheme ,
      themeMode: ThemeMode.system,
      routes:{
        Login.routeName: (context) => Login(),
      },
      initialRoute: Login.routeName ,
      home: Login(),
    );
  }
}