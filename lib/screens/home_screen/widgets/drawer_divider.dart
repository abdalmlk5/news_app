import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Divider(
      color: AppColors.onPrimary,
      thickness: 2,
      endIndent: width * 0.04,
      indent: width * 0.04,
    );
  }
}
