import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/models/article_model.dart';

import '../../../bloc/states.dart';
import '../../../core/app_styles.dart';
import 'article_item.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
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
        List<ArticleModel> articlesList = cubit.articlesList ?? [];
        if (state is GetNewsSuccessState) {
          return articlesList.isEmpty
              ? Center(child: Text("No data", style: AppStyles.onPrimary20500))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ArticleItem(article: articlesList[index]);
                  },
                  itemCount: articlesList.length,
                );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
