import 'dart:async';

import 'package:cep_app_de_busca/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashScreenAnimated extends StatefulWidget {
  @override
  SplashScreenAnimatedState createState() => new SplashScreenAnimatedState();
}

class SplashScreenAnimatedState extends State<SplashScreenAnimated>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BUSCA DE CEP',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: animation.value * 250,
                height: animation.value * 250,
                child: Image.asset(
                  'assets/icons/logo.jpeg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
