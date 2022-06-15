import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mvvm/layout/cubit/cubit/home_cubit.dart';
import 'package:news_app_mvvm/layout/cubit/state/home_state.dart';
import 'package:news_app_mvvm/moduels/search_screen/search_screen.dart';

import '../moduels/drawer_screen/drawer_screen.dart';

class HomeLayout extends StatelessWidget {
 const  HomeLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            drawer: DrawerScreen(),
            appBar: AppBar(
              title: Center(
                child: Text(
                  HomeCubit.get(context)
                      .appbarTitle[HomeCubit.get(context).currentIndex],
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute (
                          builder: (BuildContext context) => SearchScreen(),
                        ),);
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    )),

              ],
            ),
            body: HomeCubit.get(context)
                .screens[HomeCubit.get(context).currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.blueAccent,
                index: HomeCubit.get(context).currentIndex,
                onTap: (index) {
                  HomeCubit.get(context).changeCurrentIndex(index);
                },
                items: const [
                  Icon(Icons.home, size: 25),
                  Icon(Icons.science, size: 25),
                  Icon(Icons.health_and_safety, size: 25),
                  Icon(Icons.business_center_rounded, size: 25),
                  Icon(Icons.android, size: 25),
                  Icon(Icons.sports, size: 25),
                  // Icon(Icons.tag_faces, size: 25),
                ]),
          );
        },
      ),
    );
  }
}

/*
BottomNavigationBar(
        type:BottomNavigationBarType.fixed ,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex=index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.menu),label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),label: "Done"),
          BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),label: "Archived"),

        ],
      )
 */
