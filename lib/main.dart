import 'package:basic_calculatorapp/home_screen.dart';
import 'package:flutter/material.dart';

///Calculator Application
/*
1- Input Number
2- Input should be Numbers Only
3- Add Button,Subs Button,Multiply Button,Divide button
4- Clear Button
5- Result should be shown in text
 */
void main(){
  runApp(const CalculatorApp());
}
class CalculatorApp extends StatelessWidget{
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}