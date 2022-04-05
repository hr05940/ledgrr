import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ledgrr/Screens/menu.dart';
class SavingsPage extends StatefulWidget {
  const SavingsPage({ Key? key }) : super(key: key);

  @override
  State<SavingsPage> createState() => _SavingsState();
}

class _SavingsState extends State<SavingsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromRGBO(102, 85, 95, 1),
      centerTitle: true,
      title: Text('Savings')),  
      drawer: MainDrawer(),
    );
  }
}