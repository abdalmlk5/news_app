import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/home_screen/views/categories_view.dart';
import 'package:news_app/screens/home_screen/views/sources_view.dart';
import 'package:news_app/screens/home_screen/widgets/home_drawer.dart';

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
      appBar: AppBar(title: Text("home")),

      drawer: selectedCategory != null
          ? HomeDrawer(
              onGoToHomeClicked: () {
                setState(() {
                  selectedCategory = null;
                });
              },
            )
          : null,
      body: selectedCategory == null
          ? CategoriesView(
              onTap: (CategoryModel model) {
                setState(() {
                  selectedCategory = model;
                });
              },
            )
          : SourcesView(categoryID: selectedCategory!.id),
    );
  }
}
