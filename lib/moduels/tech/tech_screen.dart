import 'package:flutter/material.dart';

import '../../shared/network/remote/http_helper.dart';
import '../../utils/news_card_desgin.dart';
class TechScreen extends StatelessWidget {
  const TechScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: HttpHelper.fetchCategoryArticles("technology"),
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
