import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/providers/news_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: ListView.builder(
        itemCount: news.newsList.length,
        itemBuilder: (context, index) {
          final res = news.newsList[index];
          return ListTile(
            title: Text(res.title),
            subtitle: Text(res.articleId),
          );
        },
      ),
    );
  }
}
