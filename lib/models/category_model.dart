import 'package:news_app/core/app_assets.dart';

class CategoryModel {
  String id, label, image, darkImage;

  CategoryModel({
    required this.id,
    required this.label,
    required this.image,
    required this.darkImage,
  });

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        id: "general",
        label: "General",
        image: AppAssets.generalDark,
        darkImage: AppAssets.general,
      ),
      CategoryModel(
        id: "business",
        label: "Business",
        image: AppAssets.businessDark,
        darkImage: AppAssets.business,
      ),
      CategoryModel(
        id: "sports",
        label: "Sports",
        image: AppAssets.sportDark,
        darkImage: AppAssets.sport,
      ),
      CategoryModel(
        id: "health",
        label: "Health",
        image: AppAssets.healthDark,
        darkImage: AppAssets.health,
      ),
      CategoryModel(
        id: "entertainment",
        label: "Entertainment",
        image: AppAssets.entertainmentDark,
        darkImage: AppAssets.entertainment,
      ),
      CategoryModel(
        id: "technology",
        label: "Technology",
        image: AppAssets.technologyDark,
        darkImage: AppAssets.technology,
      ),
      CategoryModel(
        id: "science",
        label: "Science",
        image: AppAssets.scienceDark,
        darkImage: AppAssets.science,
      ),
    ];
  }
}
