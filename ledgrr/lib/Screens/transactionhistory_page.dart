import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ledgrr/Screens/menu.dart';
class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({ Key? key }) : super(key: key);

  @override
  State<TransactionHistoryPage> createState() => _TransactionState();
}

class _TransactionState extends State<TransactionHistoryPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      backgroundColor: Color.fromRGBO(102, 85, 95, 1),
      centerTitle: true,
      title: Text('Transaction History')),  
      drawer: MainDrawer(),
    );
  }
}