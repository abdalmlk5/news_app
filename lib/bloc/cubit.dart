import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:news_app/core/api/api_manager.dart';

import '../models/article_model.dart';
import '../models/source_model.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  List<SourceModel>? sourcesList = [];
  List<ArticleModel>? articlesList = [];
  int selectedIndex = 0;

  Future<void> getSources({required String categoryID}) async {
    emit(GetSourcesLoadingState());

    var response = await ApiManager.getSources(categoryID: categoryID);

    if (response != null) {
      sourcesList = response.sources;
      emit(GetSourcesSuccessState());
      getNewsArticles();
    } else {
      emit(GetSourcesErrorState());
    }
  }

  Future<void> getNewsArticles() async {
    emit(GetNewsLoadingState());

    var response = await ApiManager.getNewsData(
      sourcesID: sourcesList![selectedIndex].id ?? '',
    );

    if (response != null) {
      articlesList = response.articles;
      emit(GetNewsSuccessState());
    } else {
      emit(GetNewsErrorState());
    }
  }

  void changeSelectedIndex(int index) {
    if (selectedIndex == index) return;
    selectedIndex = index;
    getNewsArticles();
    emit(OnHomeTabsChangedState());
  }
}
