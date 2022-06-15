import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mvvm/layout/cubit/state/home_state.dart';
import 'package:news_app_mvvm/shared/network/local/cache_helper.dart';
import 'package:news_app_mvvm/shared/network/remote/http_helper.dart';

import '../../../moduels/Home/home_screen.dart';
import '../../../moduels/business/business_screen.dart';
import '../../../moduels/health/health_screen.dart';
import '../../../moduels/science/science_screen.dart';
import '../../../moduels/sports/sports_screen.dart';
import '../../../moduels/tech/tech_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  ThemeMode mode = ThemeMode.light;

  List<Widget> screens = [
    HomeScreen(),
    ScienceScreen(),
    HealthScreen(),
    BusinessScreen(),
    TechScreen(),
    SportsScreen(),
  ];

  List<String> appbarTitle = [
    "General",
    "Science",
    "Health",
    "Business",
    "Tech",
    "Sports",
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> articlesData = [];

  getArticles() {
    articlesData = HttpHelper.fetchArticles();
    emit(FetchArticlesState());
    return articlesData;
  }

  getCategoryArticles(String category) {
    HttpHelper.fetchCategoryArticles(category);
    emit(FetchCategoryArticlesState());
  }

  getSearchArticles(String search) {
    HttpHelper.fetchCategoryArticles(search);
    emit(FetchSearchArticlesState());
  }

  bool isDark = false;

  void changeThemeMode({ bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeState());

    } else {
      isDark = !isDark;
      CatheHelper.putDate(key: "isDark", value: isDark).then((value) {
        emit(ChangeModeState());
      });
    }

  }
}
