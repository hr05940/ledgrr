import 'package:flutter/material.dart';
import 'package:ledgrr/Screens/login/login.dart';
import 'package:ledgrr/constraints.dart';
import 'package:ledgrr/components/size_config.dart';
import 'package:ledgrr/Screens/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //     primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      // home: LoginScreen(),
      home: Dashboard(),
    );
  }
}
