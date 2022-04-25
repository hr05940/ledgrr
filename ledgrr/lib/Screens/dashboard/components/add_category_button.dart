import 'package:flutter/material.dart';
import 'package:ledgrr/components/style.dart';
import 'hero_route.dart';

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: _heroAddCategory,
        onPressed: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return const _AddCategoryPopupCard();
        }));
        },
      backgroundColor: AppColors.primaryColor,
      child: Icon(Icons.add),
    );
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