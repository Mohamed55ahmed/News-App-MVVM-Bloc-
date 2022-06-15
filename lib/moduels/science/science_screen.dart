import 'package:flutter/material.dart';
import 'package:news_app_mvvm/utils/news_card_desgin.dart';

import '../../shared/network/remote/http_helper.dart';
class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: HttpHelper.fetchCategoryArticles("science"),
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
  }
}
