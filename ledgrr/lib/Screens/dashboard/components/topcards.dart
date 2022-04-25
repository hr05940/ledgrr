import 'package:flutter/material.dart';
import 'package:ledgrr/components/style.dart';
import 'package:intl/intl.dart';

class TopCard_Amount extends StatefulWidget {
  const TopCard_Amount({ Key? key }) : super(key: key);

  @override
  State<TopCard_Amount> createState() => _TopCard_AmountState();
}

class _TopCard_AmountState extends State<TopCard_Amount> {

  String heading = "";
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('TOTAL BALANCE', style: AppText.TextBody),
          Text('Rs. 10,000', style: AppText.SubHeading)
        ],
      )
    );
  }
}

class TopCard_Date extends StatefulWidget {
  const TopCard_Date({ Key? key }) : super(key: key);

  @override
  State<TopCard_Date> createState() => _TopCard_DateState();
}

class _TopCard_DateState extends State<TopCard_Date> {

  String heading = "";
  String text = "";

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String date = DateFormat.yMMMMd().format(now);
    String day = DateFormat('EEEE').format(now);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(day, style: AppText.TextBody),
          Text(date, style: AppText.SubHeading)
        ],
      )
    );
  }
}
