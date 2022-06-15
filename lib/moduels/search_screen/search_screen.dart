import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_mvvm/constants.dart';
import 'package:news_app_mvvm/utils/icon_utile.dart';
import 'package:news_app_mvvm/utils/text_form_field_util.dart';
import 'package:news_app_mvvm/utils/text_utile.dart';

import '../../shared/network/remote/http_helper.dart';
import '../../utils/news_card_desgin.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  var search="";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Search",
          textAlign: TextAlign.center,
        )),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        //search
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            width: width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: AuthTextFromField(
                onChangeFun: (value) {
                  search=value;
                },
                controller: searchController,
                obscureText: false,
                validator: (String value) {
                  if (value.isEmpty) {
                    return "search must not empty";
                  }
                  return null;
                },
                hintText: "Search",
                textInputType: TextInputType.text,
                prefixIcon:
                    AuthIcon(icon: Icons.search, color: kBlackColor, size: 26),
                suffixIcon: const Text("")),
          ),
        ),

        //list View
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Column(
            children: [
              FutureBuilder(
                future: HttpHelper.getSearch("$search"),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    if(snapshot.hasData==null){
                      return CircularProgressIndicator();
                    }else{
                      return Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return buildCardDesgin(snapshot.data, index, context);
                          },
                        ),
                      );
                    }

                  } else {
                    return Center(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child:KTextUtils(
                          text: "No Search News",
                          size: 26, color: kBlackColor, fontWeight: FontWeight.bold, textDecoration: TextDecoration.none) ,
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
