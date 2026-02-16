import 'package:flutter/material.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/screens/home_screen/widgets/drawer_divider.dart';

import 'drawer_row_item.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onGoToHomeClicked;
  const HomeDrawer({super.key, required this.onGoToHomeClicked});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      bottom: false,
      child: Drawer(
        width: width * 0.7,
        child: Column(
          children: [
            Container(
              height: height * 0.2,
              color: AppColors.onPrimary,
              alignment: Alignment.center,
              child: Text("News App", style: AppStyles.primary24700),
            ),
            InkWell(
              onTap: () {
                onGoToHomeClicked();
                Navigator.pop(context);
              },
              child: DrawerRowItem(
                iconName: AppAssets.home,
                label: "Go To Home",
              ),
            ),
            DrawerDivider(),
            DrawerRowItem(iconName: AppAssets.theme, label: "Theme"),
            DrawerDivider(),
            DrawerRowItem(iconName: AppAssets.language, label: "Language"),
          ],
        ),
      ),
    );
  }
}
