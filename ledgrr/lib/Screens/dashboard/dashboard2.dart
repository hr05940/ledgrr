import 'package:flutter/material.dart';
// import 'package:ledgrr/Screens/dashboard/components/add_category_button.dart';
// import 'package:ledgrr/Screens/dashboard/components/fakedata.dart';
import 'package:ledgrr/json/fakedata.dart';
import 'package:ledgrr/Screens/dashboard/components/topcards.dart';
import 'package:ledgrr/Screens/dashboard/components/category_card.dart';
import 'package:ledgrr/Screens/side_menu/menu.dart';
import 'package:ledgrr/components/style.dart';
// import 'components/hero_route.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({ Key? key }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {

  bool isCollapsed = true;
  bool category_cards = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _menuScaleAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            decoration: BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/icons/header.png'),
              alignment: Alignment.topRight)),
          ),
          menu(context),
          dashboard(context),
        ],
      )
    );
  }

  //navbar
  // Widget navbar(context) {
  //   return BottomAppBar(
  //     color: AppColors.tertiaryColor,
  //     shape: CircularNotchedRectangle(),
  //     notchMargin: 5,
  //     child: Row(
  //       mainAxisSize: MainAxisSize.max,
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         IconButton(icon: Icon(Icons.home, color: AppColors.backgroundColor), onPressed: () {},),
  //         IconButton(icon: Icon(Icons.bar_chart_rounded, color: AppColors.backgroundColor), onPressed: () {},),
  //         IconButton(icon: Icon(Icons.account_balance_wallet, color: AppColors.backgroundColor), onPressed: () {},),
  //         IconButton(icon: Icon(Icons.person, color: AppColors.backgroundColor), onPressed: () {},)
  //       ],
  //     )
  //   );
  // }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: MainDrawer(),
      )
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0: 0.6 * screenWidth,
      right: isCollapsed ? 0: -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          elevation: isCollapsed? 0: 8,
          color: Colors.transparent,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (isCollapsed){
                              _controller.forward();
                              category_cards = false;
                            }
                            else{
                              _controller.reverse();
                              category_cards = true;
                            }
                            
                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("DASHBOARD", style: AppText.MainHeading),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),

                  SizedBox(height: 20,),

                  Container(
                    height: 128,
                    width: screenWidth,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        TopCard_Amount(),
                        TopCard_Date()
                      ],
                    )
                  ),
                  
                  SizedBox(height: 32,),

                  //grid
                  Container(
                    child: CategoryContent(categories: fakeData, enablecard: category_cards)
                  )

                ],
              )
            )
          ),

        )
      )
    );
  }
}