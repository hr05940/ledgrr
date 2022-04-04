import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ledgrr/Screens/login/login.dart';
import 'package:ledgrr/Screens/signin/components/background.dart';
import 'package:ledgrr/Screens/signin/components/or_divider.dart';
import 'package:ledgrr/Screens/signin/components/social_icon.dart';
import 'package:ledgrr/components/AccountCheck.dart';
import 'package:ledgrr/components/roundbutton.dart';
import 'package:ledgrr/components/roundinputfield.dart';
import 'package:ledgrr/components/roundpasswordfield.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "SignUp",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Open Sans M',
                fontSize: 25,
                color: Color.fromRGBO(102, 85, 95, 1)),
          ),
          SvgPicture.asset(
            "assets/icons/login.svg",
            height: size.height * 0.2,
          ),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          SizedBox(height: size.height * 0.05),
          RoundedButton(
            text: "SIGNUP",
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return LoginScreen();
              //     },
              //   ),
              // );
            },
          ),
          SizedBox(height: size.height * 0.03),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return LoginScreen();
              //     },
              //   ),
              // );
            },
          ),
          OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocalIcon(
                iconSrc: "assets/icons/facebook.svg",
                press: () {},
              ),
              SocalIcon(
                iconSrc: "assets/icons/twitter.svg",
                press: () {},
              ),
              SocalIcon(
                iconSrc: "assets/icons/google-plus.svg",
                press: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
