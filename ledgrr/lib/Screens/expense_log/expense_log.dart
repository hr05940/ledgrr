import 'package:flutter/material.dart';
import 'package:ledgrr/components/style.dart';

class ExpenseLog extends StatefulWidget {
  const ExpenseLog({ Key? key }) : super(key: key);

  @override
  State<ExpenseLog> createState() => _ExpenseLogState();
}

class _ExpenseLogState extends State<ExpenseLog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "There is some text here",
        style: AppText.TextBody
      )
    );
  }
}