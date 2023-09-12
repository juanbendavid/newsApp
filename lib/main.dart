import 'package:flutter/material.dart';
import 'package:news_app/config/Theme/theme.dart';
import 'package:news_app/presentation/screens/detail_page.dart';
import 'package:news_app/presentation/screens/home_page.dart';
import 'package:news_app/presentation/screens/providers/news_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => NewsProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "News App",
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/detail': (context) => const DetailPage(),
        },
        theme: ThemeApp().theme(),
      ),
    );
  }
}
