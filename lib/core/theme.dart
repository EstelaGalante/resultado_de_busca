import 'package:flutter/material.dart';

class Theme extends StatefulWidget {
  const Theme({Key? key}) : super(key: key);

  @override
  _ThemeState createState() => _ThemeState();
}

class MyApp extends ChangeNotifier {
  static bool _isDark = false;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: Colors.grey.shade400),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  buttonTheme: ButtonThemeData(buttonColor: Colors.amber),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
);

class _ThemeState extends State<Theme> {
  @override
  Widget build(BuildContext context) {
    return build(context);
  }
}
