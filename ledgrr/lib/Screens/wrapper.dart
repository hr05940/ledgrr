import 'package:ledgrr/Screens/login/authenticate.dart';
import 'package:ledgrr/Screens/navbar/navbar.dart';
import 'package:ledgrr/Screens/dashboard/dashboard2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ledgrr/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LedgrrUser>(context);
    if (user == null ) {
      return Authenticate(); 
    } else {
      return navbar();
    }
  }
}