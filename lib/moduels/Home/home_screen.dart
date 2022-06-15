import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_mvvm/layout/cubit/cubit/home_cubit.dart';
import 'package:news_app_mvvm/layout/cubit/state/home_state.dart';
import 'package:news_app_mvvm/shared/network/remote/http_helper.dart';
import 'package:news_app_mvvm/utils/news_card_desgin.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return  BlocProvider(
        create:(BuildContext context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (BuildContext context, Object? state) {  },
          builder: (BuildContext context, state) {
            return FutureBuilder(
              future: HttpHelper.fetchArticles(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
              {
                if(snapshot.hasData){
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index)
                    {
                      return buildCardDesgin(snapshot.data, index, context) ;

                    },);
                }else{
                  return Center(child: CircularProgressIndicator());
                }

              },);
          },


        ),
      );

    /*
      FutureBuilder(
          future: HttpHelper.fetchArticles(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      FUN.openLink("${snapshot.data[index].url}");
                    },
                    child: Card(
                      color: kWhiteColor,
                      elevation: 5,
                      shadowColor: kBlackColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25)),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      ("${snapshot.data[index].urlToImage}" ==
                                          null)
                                          ? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fbitsofco.de%2Fhandling-broken-images-with-service-worker%2F&psig=AOvVaw2mtOVMADLEV37XSyZUZekl&ust=1640980369908000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJC7k7KmjPUCFQAAAAAdAAAAABAD"
                                          : "${snapshot.data[index].urlToImage}")),
                            ),
                          ),
                          Container(
                              alignment: Alignment.topCenter,
                              width: MediaQuery.of(context).size.width * 0.90,
                              child: Text(
                                " ${snapshot.data[index].title} ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: kBlackColor),
                                textAlign: TextAlign.center,
                              )),
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      FUN.shareLink(snapshot.data[index].url);
                                    }, icon: Icon(Icons.share)),
                                IconButton(
                                    onPressed: () {
                                      FUN.copyLink(snapshot.data[index].url).then((value){
                                        final snackBar = SnackBar(
                                          content: Text('Copy...'),
                                        );
                                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      });
                                    }, icon: Icon(Icons.copy))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
        */
  }
}
