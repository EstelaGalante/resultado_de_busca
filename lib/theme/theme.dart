import 'dart:developer';

import 'package:flutter/material.dart';

class ThemeColors extends StatefulWidget {
  const ThemeColors({Key? key}) : super(key: key);

  @override
  _ThemeColorsState createState() => _ThemeColorsState();
}

class _ThemeColorsState extends State<ThemeColors> {
  @override
  Widget build(BuildContext context) {
    return build(context);
  }

  void initState() {
    super.initState();
    var currentTheme;
    currentTheme.addListener(() {
      log('Changing Theme');
      setState(() {});
    });
  }
}
