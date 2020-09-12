import 'package:flutter/material.dart';
import 'Home_page/home_page.dart';
import 'package:expense_detection/Home_page/log_sign_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Detection',
      theme: ThemeData(
        buttonColor: Color(0xFF4CCC88),
        primarySwatch:Colors.green,
        fontFamily: 'Quicksand',
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => UserLogin(),
        HomePage.id:(context)=> HomePage(),
      },
//      home: HomePage(),
    );
  }
}