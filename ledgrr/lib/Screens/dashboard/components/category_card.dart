import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ledgrr/Screens/expense_log/expense_log.dart';
// import 'package:ledgrr/Screens/side_menu/transactionhistory_page.dart';
import 'package:ledgrr/components/style.dart';
import 'hero_route.dart';
// import 'number_inc_dec.dart';
// import 'package:ledgrr/json/category_json.dart';
import 'package:ledgrr/json/models.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

class CategoryContent extends StatelessWidget {
  const CategoryContent({
    Key? key,
    required this.categories,
    required this.enablecard,
  }) : super(key: key);

  final List<Category> categories;
  final bool enablecard;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final _category = categories[index];
        return _CategoryCard(category: _category, enablecard: enablecard,);
      }, gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  /// {@macro todo_card}
  const _CategoryCard({
    Key? key,
    required this.category,
    required this.enablecard,
  }) : super(key: key);

  final Category category;
  final bool enablecard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (enablecard) {
          Navigator.of(context).push(
            HeroDialogRoute(
              builder: (context) => Center(
                child: _CategoryPopupCard(category: category),
              ),
            ),
          );
        }
      },
      child: Hero(
        // createRectTween: (begin, end) {
        //   return CustomRectTween(begin: begin, end: end);
        // },
        tag: category.name,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Material(
            elevation: 2,
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  _CategoryTitle(title: category.name),
                  const SizedBox(
                    height: 16,
                  ),
                  _CategoryAmount(amount: category.spent),
                  // if (todo.items != null) ...[
                  //   const Divider(),
                  //   _TodoItemsBox(items: todo.items),
                  // ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryTitle extends StatelessWidget {
  /// {@macro todo_title}
  const _CategoryTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppText.TextBody
    );
  }
}

class _CategoryAmount extends StatelessWidget {
  const _CategoryAmount({Key? key, required this.amount}) : super(key: key);
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: EdgeInsets.only(left: 4, right: 4),
      child: NumberInputWithIncrementDecrement(
        controller: TextEditingController(),
        buttonArrangement: ButtonArrangement.incRightDecLeft,
        min: 0,
        autovalidateMode: AutovalidateMode.disabled,
        // max: 3,
        incDecFactor: 50,
        decIcon: Icons.arrow_left_outlined,
        incIcon: Icons.arrow_right_outlined,
        incDecBgColor: AppColors.backgroundColor,
        decIconColor: AppColors.primaryColor,
        incIconColor: AppColors.primaryColor,
        numberFieldDecoration: InputDecoration(border: InputBorder.none,),
        // widgetContainerDecoration: BoxDecoration(border: Border.all(color: AppColors.backgroundColor))
        widgetContainerDecoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
        style: AppText.SubHeading,
        decIconDecoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
        ),
        incIconDecoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
        ),
        // scaleHeight: 0.2,
        // scaleWidth: 0.5,
      ),
    );
  }
}

class _CategoryPopupCard extends StatelessWidget {
  const _CategoryPopupCard({Key? key, required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context).push(
      //     HeroDialogRoute(
      //       builder: (context) => Center(
      //         // child: _CategoryPopupCard(category: category),
      //         // child: LoginScreen(),
      //         child: ExpenseLog(),
      //       ),
      //     ),
      //   );
      // },
      child: Hero(
        // createRectTween: (begin, end) {
        //   return CustomRectTween(begin: begin, end: end);
        // },
        tag: category.name,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64.0),
          child: Material(
            elevation: 2,
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  // ExpenseLog(),
                  Expanded(
                    child: ExpenseLog()
                  ),
                  // TransactionHistoryPage(),
                  // _CategoryTitle(title: category.name),
                  const SizedBox(
                    height: 8,
                  ),
                  // if (todo.items != null) ...[
                  //   const Divider(),
                  //   _TodoItemsBox(items: todo.items),
                  // ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
    // return Hero(
    //   tag: category.name,
    //   // createRectTween: (begin, end) {
    //   //   return CustomRectTween(begin: begin, end: end);
    //   // },
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Material(
    //       borderRadius: BorderRadius.circular(8),
    //       color: AppColors.backgroundColor,
    //       child: SizedBox(
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: SingleChildScrollView(
    //             child: Column(
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 _CategoryTitle(title: category.name),
    //                 const SizedBox(
    //                   height: 8,
    //                 ),

    //                 // if (todo.items != null) ...[
    //                 //   const Divider(),
    //                 //   _TodoItemsBox(items: todo.items),
    //                 // ],
    //                 Container(
    //                   margin: const EdgeInsets.all(8),
    //                   decoration: BoxDecoration(
    //                     color: Colors.black12,
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                   // child: const TextField(
    //                   //   maxLines: 8,
    //                   //   cursorColor: Colors.white,
    //                   //   decoration: InputDecoration(
    //                   //       contentPadding: EdgeInsets.all(8),
    //                   //       hintText: 'Write a note...',
    //                   //       border: InputBorder.none),
    //                   // ),
    //                   // child: Column(

    //                   //   Navigator.of(context).push(HeroDialogRoute(builder: (context) => LoginScreen()));
    //                   // )
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}