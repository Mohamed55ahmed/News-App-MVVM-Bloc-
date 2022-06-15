import '../../../models/articles_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  static String APIKEY = "f49a76cec755418390a8146af024b146";


// home
  static fetchArticles() async {
    List<Articles> listArticles = [];

    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$APIKEY");
    var respons = await http.get(url);
    var responsBody = jsonDecode(respons.body)["articles"];
    for (var i in responsBody) {
      Articles x = Articles(
          description: i["description"],
          title: i["title"],
          url: i["url"],
          urlToImage: i["urlToImage"]);
      listArticles.add(x);
    }
    return listArticles;
  }

//category
  static fetchCategoryArticles(String category) async {
    List<Articles> listArticles = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$APIKEY");
    var respons = await http.get(url);
    var responsBody = jsonDecode(respons.body)["articles"];
    for (var i in responsBody) {
      Articles x = Articles(
          description: i["description"],
          title: i["title"],
          url: i["url"],
          urlToImage: i["urlToImage"]);
      listArticles.add(x);
    }
    return listArticles;
  }


  //search
//https://newsapi.org/v2/everything?q=tesla&apiKey=f49a76cec755418390a8146af024b146
static getSearch(String search){
return fetchSearchArticles(search);
}
  static fetchSearchArticles(String search) async {
    List<Articles> listArticles = [];
    listArticles.clear();
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$search&apiKey=f49a76cec755418390a8146af024b146");
    var respons = await http.get(url);
    var responsBody = jsonDecode(respons.body)["articles"];
    for (var i in responsBody) {
      Articles x = Articles(
          description: i["description"],
          title: i["title"],
          url: i["url"],
          urlToImage: i["urlToImage"]);
      listArticles.add(x);
    }
    return listArticles;
  }
}
