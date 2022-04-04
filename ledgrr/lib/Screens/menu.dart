// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ledgrr/Screens/dashboard/dashboard.dart';
import 'package:ledgrr/Screens/bills_page.dart';
import 'package:ledgrr/Screens/loans_page.dart';
import 'package:ledgrr/Screens/transactionhistory_page.dart';
import 'package:ledgrr/Screens/savings_page.dart';

class MainDrawer extends StatelessWidget{
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Ash Ketchum';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(102, 85, 95, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              name: name,
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  buildMenuItem(
                    text: 'Dashboard',
                    icon: Icons.dashboard,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Transaction History',
                    icon: Icons.access_time,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Bills',
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Loans',
                    icon: Icons.payment,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Savings',
                    icon: Icons.attach_money,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 260),
                  const Divider(color: Colors.white70),
                  buildMenuItem(
                    text: 'Sign Out',
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 4),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String name,
  }) =>
      InkWell(
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      );


  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard(),
        ));
        break;
    case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TransactionHistoryPage(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BillsPage(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoansPage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SavingsPage(),
        ));
        break;
    }
  }
}