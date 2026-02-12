import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/widgets/news_screen.dart';

import '../../../core/api/api_manager.dart';
import '../../../core/app_styles.dart';

class SourcesView extends StatefulWidget {
  final String categoryID;

  const SourcesView({super.key, required this.categoryID});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources( categoryID: widget.categoryID,),
      builder: (context, snapshot) {
        if (snapshot.connectionState == .waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("some thing went wrong", style: AppStyles.onPrimary20500);
        } else {
          var dataList = snapshot.data?.sources ?? [];
          return Column(
            children: [
              DefaultTabController(
                initialIndex: selectedIndex,
                length: dataList.length,
                child: TabBar(
                  onTap: (value) => setState(() {
                    selectedIndex = value;
                  }),
                  isScrollable: true,
                  tabAlignment: .start,
                  labelStyle: AppStyles.onPrimary16700,
                  unselectedLabelStyle: AppStyles.onPrimary14500,
                  indicatorColor: Colors.black,
                  dividerColor: Colors.transparent,
                  tabs: dataList
                      .map((e) => Tab(child: Text(e.name ?? "")))
                      .toList(),
                ),
              ),
              Expanded(
                child: NewsScreen(sourcesID: dataList[selectedIndex].id ?? '',
                  ),
              ),
            ],
          );
        }
      },
    );
  }
}
