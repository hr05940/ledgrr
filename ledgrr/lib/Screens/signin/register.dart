import 'package:flutter/material.dart';
import 'package:ledgrr/Screens/login/login.dart';
import 'package:ledgrr/components/style.dart';
import 'package:ledgrr/services/auth.dart';
import 'package:ledgrr/Screens/dashboard/components/hero_route.dart';

class Register extends StatefulWidget {
  
  final Function? toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              Navigator.of(context).push(HeroDialogRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              TextFormField(
                validator: (val) => val!.length < 6 ? 'Password must be at least 6 characters long' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                color: AppColors.primaryColor,
                child: Text('Sign Up', style: TextStyle(color: AppColors.backgroundColor, fontFamily: 'Open Sans M', fontSize: 16)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() => error = 'please enter valid credentials');
                    }
                  }
                }),
                SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0)
                )
            ],
          )
        )
      ),
    );
  }
}