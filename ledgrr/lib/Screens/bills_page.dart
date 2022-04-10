import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ledgrr/Screens/appbar.dart';
import 'package:ledgrr/Screens/menu.dart';
// import 'package:intl/intl.dart';

class BillsPage extends StatefulWidget {
  const BillsPage({ Key? key }) : super(key: key);

  @override
  State<BillsPage> createState() => _BillsState();
}

class _BillsState extends State<BillsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: BaseAppBar(
          title: Text('Bills'),
          appBar: AppBar(),
        ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // children: [
                  //   Text(DateFormat.yMMMd().format(DateTime.now())),
                  //   Text('Today'),
                  // ],
                )
              )
            ],
          )
        ],
      )
    );
  }

}