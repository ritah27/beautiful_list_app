import 'package:flutter/material.dart';
import 'package:sample_beautiful/beautiful.dart';



void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Beautiful Sample App',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.amber),
        useMaterial3: true,
      ),
      home: const ListViewBuilder(),
       
    );
  }
}

