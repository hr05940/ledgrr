import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'menu.dart';
import 'appbar.dart';

class SavingsPage extends StatefulWidget {
  const SavingsPage({ Key? key }) : super(key: key);

  @override
  State<SavingsPage> createState() => _SavingsState();
}

class _SavingsState extends State<SavingsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
          title: Text('Savings'),
          appBar: AppBar(),
        ),
      drawer: MainDrawer(),
    );
  }
}