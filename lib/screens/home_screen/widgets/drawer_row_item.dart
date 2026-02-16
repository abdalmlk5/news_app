import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_styles.dart';

class DrawerRowItem extends StatelessWidget {
  final String iconName, label;
  const DrawerRowItem({super.key, required this.iconName, required this.label});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * .06,
        vertical: width * .04,
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconName, color: AppColors.onPrimary),
          SizedBox(width: 20),
          Text(label, style: AppStyles.onPrimary20700),
        ],
      ),
    );
  }
}
