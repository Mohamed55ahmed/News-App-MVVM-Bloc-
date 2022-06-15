import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mvvm/constants.dart';
import 'package:news_app_mvvm/layout/cubit/cubit/home_cubit.dart';
import 'package:news_app_mvvm/layout/cubit/state/home_state.dart';
import 'package:news_app_mvvm/shared/network/local/cache_helper.dart';
import 'layout/home_layout.dart';
import 'moduels/splach/splach_screen.dart';

void main() async{

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            theme: ThemeData(
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                primarySwatch: Colors.blue,
                //appbar
                appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.5,
                    iconTheme: IconThemeData(color: kBlackColor),
                    titleTextStyle: TextStyle(
                        color: kBlackColor,
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                    )

                )
            ),
            darkTheme:ThemeData(
                scaffoldBackgroundColor: kGrayColor,
                appBarTheme: const AppBarTheme(
                    backgroundColor: kGrayColor,
                    iconTheme: IconThemeData(
                        color: kBlackColor
                    ),
                    titleTextStyle:TextStyle(
                        color: kBlackColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    )
                ),

            ) ,
            themeMode: HomeCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
