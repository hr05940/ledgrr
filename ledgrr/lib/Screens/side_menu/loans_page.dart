import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'menu.dart';
import 'appbar.dart';

class LoansPage extends StatefulWidget {
  const LoansPage({ Key? key }) : super(key: key);

  @override
  State<LoansPage> createState() => _LoansState();
}

class _LoansState extends State<LoansPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
          title: Text('Loans'),
          appBar: AppBar(),
        ),
      drawer: MainDrawer(),
    );
  }
}