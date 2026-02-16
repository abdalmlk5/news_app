import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/home_screen/widgets/news_screen.dart';

import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import '../../../core/app_styles.dart';
import '../../../models/source_model.dart';

class SourcesView extends StatelessWidget {
  final String categoryID;

  const SourcesView({super.key, required this.categoryID});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(categoryID: categoryID),

      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {
          if (state is GetNewsLoadingState) {
            showDialog(
              context: context,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );
          } else if (state is GetNewsSuccessState) {
            Navigator.pop(context);
          } else if (state is GetNewsErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("some thing went wrong")));
          }
        },
        builder: (BuildContext context, state) {
          var cubit = HomeCubit.get(context);
          List<SourceModel> sourcesList = cubit.sourcesList ?? [];
          int selectedIndex = cubit.selectedIndex;
          return Column(
            children: [
              DefaultTabController(
                initialIndex: selectedIndex,
                length: sourcesList.length,
                child: TabBar(
                  onTap: (value) => cubit.changeSelectedIndex(value),
                  isScrollable: true,
                  tabAlignment: .start,
                  labelStyle: AppStyles.onPrimary16700,
                  unselectedLabelStyle: AppStyles.onPrimary14500,
                  indicatorColor: Colors.black,
                  dividerColor: Colors.transparent,
                  tabs: sourcesList
                      .map((e) => Tab(child: Text(e.name ?? "")))
                      .toList(),
                ),
              ),
              Expanded(child: NewsScreen()),
            ],
          );
        },
      ),
    );
  }
}
