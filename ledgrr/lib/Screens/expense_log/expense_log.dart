import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ledgrr/components/style.dart';
import 'package:ledgrr/json/expense_log.dart';
import 'package:ledgrr/json/models.dart';

class ExpenseLog extends StatefulWidget {
  const ExpenseLog({ Key? key }) : super(key: key);

  @override
  State<ExpenseLog> createState() => _ExpenseLogState();
}

class _ExpenseLogState extends State<ExpenseLog> {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: Text(
    //     "There is some text here",
    //     style: AppText.TextBody
    //   )
    // );
    // return ExpensesContent(expenses: expenses);
    return SingleChildScrollView(
      child: ExpensesContent(expenses: expenses),
    );
  }
}

class ExpensesContent extends StatelessWidget {
  const ExpensesContent({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  final List<Expenses> expenses;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256*2,
      width: 256 * 1.2,
      child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            return _ExpenseCard(expense: expenses[index]);
          }
        ),
    );
  }
}

class _ExpenseCard extends StatelessWidget {
  /// {@macro todo_title}
  const _ExpenseCard({
    Key? key,
    required this.expense,
  }) : super(key: key);

  final Expenses expense;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(expense.category, style: AppText.SubHeading),
        Card(
          color: AppColors.secondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // child: Text("\$" + expense.amount.toString(), style: AppText.TextBody),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$" + expense.amount.toString(), style: AppText.TextBody),
                Column(
                  children: [
                    Text(expense.time, style: AppText.TextBody, textAlign: TextAlign.right,),
                    Text(expense.date, style: TextStyle(color: AppColors.primaryColor, fontFamily: 'Open Sans L', fontSize: 8) )
                ],)
              ],
            )
          ),
        )
      ],
    );
  }
}