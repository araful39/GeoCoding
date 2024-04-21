import 'package:flutter/material.dart';
import 'package:untitled10/connectivity_plus/connectivity_plus.dart';

void main(){
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
