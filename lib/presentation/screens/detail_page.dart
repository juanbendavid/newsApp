import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Result arguments =
        ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
      body: Center(child: Text(arguments.title)),
    );
  }
}
