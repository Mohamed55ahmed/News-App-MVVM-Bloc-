import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mvvm/layout/cubit/cubit/home_cubit.dart';
import 'package:news_app_mvvm/layout/cubit/state/home_state.dart';
import 'package:news_app_mvvm/utils/text_utile.dart';

import '../../constants.dart';
import '../helper_screen/helper_screen.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          return Drawer(
              backgroundColor: kWhiteColor,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Text(
                        'News App',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),


                  GestureDetector(
                    onTap: (){
                      Navigator.push( context,
                        MaterialPageRoute (
                          builder: (BuildContext context) =>  HelperScreen(),
                        ),);

                    },
                    child: ListTile(
                        leading: const Icon(Icons.info_outline),
                        title: KTextUtils(
                          text: "Helper",
                          size: 20,
                          color: kBlackColor,
                          textDecoration: TextDecoration.none,
                          fontWeight: FontWeight.normal,
                        )),
                  ),

                ],
              ));
        },

      ),
    );
  }
}
