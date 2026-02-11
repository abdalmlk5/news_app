import 'package:flutter/material.dart';
import 'package:news_app/core/api/api_manager.dart';
import 'package:news_app/core/app_styles.dart';
import 'package:news_app/screens/home_screen/widgets/news_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home", style: AppStyles.onPrimary20500),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == .waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text(
              "some thing went wrong",
              style: AppStyles.onPrimary20500,
            );
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
                  child: NewsScreen(
                    sourcesID: dataList[selectedIndex].id ?? '',
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
