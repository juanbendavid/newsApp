import 'package:flutter/material.dart';
import 'package:news_app/config/Theme/theme.dart';
import 'package:news_app/presentation/screens/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
      },
      theme: ThemeApp().theme(),
    );
  }
}
