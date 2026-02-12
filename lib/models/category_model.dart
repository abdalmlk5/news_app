import 'package:news_app/core/app_assets.dart';

class CategoryModel {
  String id, label, image;

  CategoryModel({required this.id, required this.label, required this.image});

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(id: "general", label: "General", image: AppAssets.generalDark),
      CategoryModel(
        id: "business",
        label: "Business",
        image: AppAssets.businessDark,
      ),
      CategoryModel(id: "sports", label: "Sports", image: AppAssets.sportDark),
      CategoryModel(id: "health", label: "Health", image: AppAssets.healthDark),
      CategoryModel(
        id: "entertainment",
        label: "Entertainment",
        image: AppAssets.entertainmentDark,
      ),
      CategoryModel(
        id: "technology",
        label: "Technology",
        image: AppAssets.technologyDark,
      ),
      CategoryModel(id: "science", label: "Science", image: AppAssets.scienceDark),
    ];
  }
}
