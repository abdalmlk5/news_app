import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/app_assets.dart';
import '../../../core/app_colors.dart';
import '../../../core/app_styles.dart';
import '../../../core/providers/theme_provider.dart';
import '../../../models/category_model.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  final CategoryModel category;

  const CategoryCard({super.key, required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      alignment: index.isEven ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.all(16.0),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(24),
        image: DecorationImage(
          fit: BoxFit.cover,

          image: AssetImage(
            themeProvider.isDark() ? category.darkImage : category.image,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Text(
            category.label,
            style: AppStyles.primary24700.copyWith(fontSize: 30),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(100),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.only(
              right: index.isEven ? 0 : 8,
              left: index.isEven ? 8 : 0,
            ),
            child: Row(
              mainAxisSize: .min,
              children: [
                Visibility(
                  visible: index.isEven,
                  child: Text(" View All ", style: AppStyles.onPrimary24700),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    AppAssets.arrowBack,
                    color: AppColors.onPrimary,
                    height: 25,
                    width: 25,
                  ),
                ),
                Visibility(
                  visible: index.isOdd,
                  child: Text(" View All ", style: AppStyles.onPrimary24700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
