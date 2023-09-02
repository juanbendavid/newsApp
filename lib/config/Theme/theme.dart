import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData theme() => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            centerTitle: false,
            elevation: 10,
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      );
}
