import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ledgrr/Screens/menu.dart';
class LoansPage extends StatefulWidget {
  const LoansPage({ Key? key }) : super(key: key);

  @override
  State<LoansPage> createState() => _LoansState();
}

class _LoansState extends State<LoansPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromRGBO(102, 85, 95, 1),
      centerTitle: true,
      title: Text('Loans')),  
      drawer: MainDrawer(),
    );
  }
}