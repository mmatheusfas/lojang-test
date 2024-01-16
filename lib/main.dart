import 'package:flutter/material.dart';
import 'package:lojang_test/features/home/home_view.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomeView(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(224, 144, 144, 1)),
      ),
    ),
  );
}
