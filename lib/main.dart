import 'package:flutter/material.dart';
import 'package:mvvm/cat_list/view_models/cat_facts_view_model.dart';
import 'package:mvvm/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatFactsViewModel())
      ],
      child:  const MaterialApp(
        title: "MVVM",
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      )
    );
  }
}