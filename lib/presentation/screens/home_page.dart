import 'package:flutter/material.dart';
import 'package:news_app/data/providers/news_provider.dart';
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
      body: news.newsList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : _CardNews(news: news),
    );
  }
}

class _CardNews extends StatelessWidget {
  const _CardNews({
    required this.news,
  });

  final NewsProvider news;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        );
      },
      itemCount: news.newsList.length,
      itemBuilder: (context, index) {
        final res = news.newsList[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/detail',
              arguments: news.newsList[index]),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 30,
                        ),
                        child: Text(
                          res.title,
                          maxLines: 4,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //Text(res.creator.first),
                      Text(res.category[0].name),
                      //Text(res.country[0]),
                    ],
                  ),
                ),
                Hero(
                  tag: res.title,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                        width: 170,
                        height: 250,
                        placeholder: const AssetImage('assets/loading.gif'),
                        image: NetworkImage(res.imageUrl ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcs7QeC2_kP0lJEj7Q25mpHyeNkLt_oQ43uP2_jLnhozFShnw-Mba_ataiwQd_W1aByyU&usqp=CAU'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
