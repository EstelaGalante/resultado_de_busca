import 'package:cep_app_de_busca/splash/splash_page_animated.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.grey),
      ),
      home: SplashScreenAnimated(),
      debugShowCheckedModeBanner: false,
    );
  }
}
