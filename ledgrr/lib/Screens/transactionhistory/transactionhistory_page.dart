import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ledgrr/Screens/side_menu/menu.dart';
import 'package:ledgrr/Screens/side_menu/appbar.dart';
import 'package:ledgrr/Screens/transactionhistory/components/body.dart';
import 'package:ledgrr/Screens/side_menu/menu.dart';
import 'package:ledgrr/Screens/side_menu/appbar.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryPage> createState() => _TransactionState();
}

class _TransactionState extends State<TransactionHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Text('Transaction History'),
          appBar: AppBar(),
        ),
        drawer: MainDrawer(),
        body: Body());
  }
}
