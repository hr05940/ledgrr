//New Attempt
import 'package:flutter/material.dart';
import 'package:ledgrr/Screens/menu.dart';
import 'package:ledgrr/components/style.dart';

class Dashboard extends StatefulWidget {
  
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {

  bool isCollapsed = true;
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
      backgroundColor: Colors.white,

      floatingActionButton: isCollapsed? addButton(context): null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: isCollapsed? navbar(context): null,

      body: Stack(
        children: <Widget>[

          Container(
            height: size.height,
            decoration: BoxDecoration(image: DecorationImage(
              alignment: Alignment.topRight,
              image: AssetImage('assets/icons/header.png')
            )),
          ),
          
          menu(context),
          dashboard(context),
        ],
      )
    );
  }

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
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();
                            
                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("DASHBOARD", style: AppText.MainHeading),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  )
                ],
              )
            ),
          )
        ),
      
      ),
    );
  }

  Widget addButton(context) {
    return FloatingActionButton(
        onPressed: () {
          //code to execute on button press
        },
        backgroundColor: Color.fromRGBO(102, 85, 95, 1),
        child: Icon(Icons.add),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
  }

  Widget navbar(context) {

    return BottomAppBar (
      color: AppColors.tertiaryColor,
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: Icon(Icons.home, color: Colors.white,), onPressed: () {},),
          IconButton(icon: Icon(Icons.bar_chart_rounded, color: Colors.white,), onPressed: () {},),
          IconButton(icon: Icon(Icons.account_balance_wallet, color: Colors.white,), onPressed: () {},),
          IconButton(icon: Icon(Icons.person, color: Colors.white,), onPressed: () {},),
          ],
        ),
      );
    
  }
}
