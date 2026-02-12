import 'package:flutter/material.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/home_screen/views/categories_view.dart';
import 'package:news_app/screens/home_screen/views/sources_view.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home", style: AppStyles.onPrimary24700),
        centerTitle: true,
      ),
      body: selectedCategory == null
          ? CategoriesView(
              onTap: (CategoryModel model) {
                setState(() {
                  selectedCategory = model;
                });
              },
            )
          : SourcesView(
        categoryID: selectedCategory!.id,
      ),
    );
  }
}
