import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ledgrr/Screens/login/login.dart';
import 'package:ledgrr/Screens/navbar/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ledgrr/Screens/side_menu/bills_page.dart';
import 'package:ledgrr/Screens/signin/register.dart';
import 'package:ledgrr/models/user.dart';
import 'package:ledgrr/services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:ledgrr/Screens/wrapper.dart';
// import 'package:ledgrr/Screens/login/components/background.dart';
// import 'package:ledgrr/Screens/login/login.dart';
// import 'package:ledgrr/Screens/side_menu/menu.dart';
// import 'package:ledgrr/Screens/signin/signin.dart';
// import 'package:ledgrr/constraints.dart';
// import 'package:ledgrr/components/size_config.dart';
// import 'package:ledgrr/Screens/dashboard/dashboard.dart';
// import 'package:ledgrr/Screens/dashboard/dashboard1.dart';
// import 'package:ledgrr/Screens/dashboard/dashboard2.dart';

// void main() {
//   runApp(const MyApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return StreamProvider<LedgrrUser>.value(
    //   value: AuthService.user,
    //   initialData: null,
    //   child: 
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ledgrr',
        // home: Wrapper(),
        // theme: ThemeData(
        //     // primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white

        //     prim
        //     // primaryColor: Color.fromRGBO(102, 85, 95, 1),
        //     // cardColor: Color.fromRGBO(245, 224, 181, 1),

        //     textTheme: const TextTheme(
        //       headline1: TextStyle(fontFamily: 'Open Sans EB', fontSize: 50),
        //       bodyText1: TextStyle(fontFamily: 'Open Sans M', fontSize: 20)
        //     )
        //     ),
        // drawer: MainDrawer(),
        // home: Dashboard(),
        // home: LoginScreen()
        // home: Dashboard(),
        // home: navbar(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnapshot) {
            print(userSnapshot);
            if (userSnapshot.connectionState == ConnectionState.waiting) {}
            if (userSnapshot.connectionState == ConnectionState.active) {
              // if (userSnapshot.hasData) {
              //   return navbar();
              // } else {
              //   return Register();
              // }
              return navbar();
            }
            if (userSnapshot == ConnectionState.none) {
              return LoginScreen();
            }
            return BillsPage();
            // return Text("Loading...");
          },

        // ))
      ));
  }
}
