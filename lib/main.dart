import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_interview_task/view/homeScreen/homeScreeen_controller.dart';
import 'package:shopping_app_interview_task/view/homeScreen/home_screen.dart';
import 'package:shopping_app_interview_task/view/productDetailScreen/productDetails_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomescreeenController()),
        ChangeNotifierProvider(create: (context) => ProductdetailsController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
