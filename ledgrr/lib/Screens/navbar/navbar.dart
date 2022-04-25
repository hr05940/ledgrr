// import 'package:budget_tracker_ui/pages/budget_page.dart';
// import 'package:budget_tracker_ui/pages/create_budge_page.dart';
// import 'package:budget_tracker_ui/pages/daily_page.dart';
// import 'package:budget_tracker_ui/pages/profile_page.dart';
// import 'package:budget_tracker_ui/pages/stats_page.dart';
// import 'package:budget_tracker_ui/theme/colors.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ledgrr/Screens/dashboard/components/hero_route.dart';
import 'package:ledgrr/Screens/dashboard/dashboard2.dart';
import 'package:ledgrr/Screens/transactions/transactions.dart';
import 'package:ledgrr/components/style.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class navbar extends StatefulWidget {
  @override
  _navbarState createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int pageIndex = 0;
  List<Widget> pages = [
    Dashboard(),
    Transactions(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
          heroTag: _heroAddCategory,
            onPressed: () {
              Navigator.of(context).push(HeroDialogRoute(builder: (context) => _AddCategoryPopupCard()));
            },
            child: Icon(
              Icons.add,
              size: 25,
            ),
            backgroundColor: AppColors.primaryColor
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.home,
      Icons.bar_chart_rounded,
      Icons.account_balance_wallet,
      Icons.person,
    ];

    return AnimatedBottomNavigationBar(
      backgroundColor: AppColors.secondaryColor,
      activeColor: AppColors.primaryColor,
      splashColor: AppColors.primaryColor,
      // inactiveColor: Colors.black.withOpacity(0.5),
      inactiveColor: AppColors.tertiaryColor,
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
      );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}

const String _heroAddCategory = 'add-category-hero';

class _AddCategoryPopupCard extends StatelessWidget {
  const _AddCategoryPopupCard({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddCategory,
          child: Material(
            color: AppColors.secondaryColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Add Category',
                        border: InputBorder.none,
                      ),
                      style: AppText.TextBody,
                      cursorColor: Colors.white,
                      maxLines: 1,
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
