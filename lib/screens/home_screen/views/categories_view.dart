import 'package:flutter/material.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/screens/home_screen/widgets/category_card.dart';
import '../../../models/category_model.dart';

class CategoriesView extends StatelessWidget {
  final Function onTap;
  final List<CategoryModel> categories = CategoryModel.getCategories();

  CategoriesView({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          index--;
          if (index == -1) {
            return Text(
              'Good Morning\nHere is Some News For You',
              style: AppStyles.onPrimary24700,
            );
          } else {
            return GestureDetector(
                onTap: (){onTap(categories[index]);},
                child: CategoryCard(index: index,category: categories[index],));
          }
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 10),
        itemCount: categories.length + 1,
      ),
    );
  }
}
