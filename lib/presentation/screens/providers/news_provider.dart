import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:http/http.dart' as http;
//https://newsdata.io/api/1/news?apikey=pub_290727c317eeab276d7e57fba5737c3f53361&language=en

String YOUR_API_KEY = 'pub_290727c317eeab276d7e57fba5737c3f53361';
String _language = 'language=en';
String country = 'country=ca';
String url =
    'https://newsdata.io/api/1/news?apikey=$YOUR_API_KEY&q=Eliminatorias';

class NewsProvider extends ChangeNotifier {
  List<Result> newsList = [];

  NewsProvider() {
    // constructor
    print("Llamando a las noticias");
    getNews();
  }

  getNews() async {
    final response = await http.get(Uri.parse(url));
    final resp = newsModelFromJson(response.body);
    newsList.addAll(resp.results);
    notifyListeners();
    print(resp.results[0].title);
  }
}
