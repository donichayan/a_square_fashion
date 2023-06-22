import 'package:flutter/material.dart';
import 'package:vie_fashion_week/main.dart';

import 'intermediate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(
      milliseconds: 1500,
    ));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const FashionApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: FittedBox(
        fit: BoxFit.contain,
        child: ClipRRect(
          //borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            child: Image.asset(
              'assets/images/splash.jpeg',
              fit: BoxFit.cover,
              width: 300,
            ),
          ),
        ),
      ),
    );
  }
}

_bodyWidget() {
  return Scaffold(
    backgroundColor: const Color(0xffffffff),
    body: Stack(
      children: <Widget>[
        Positioned(
          left: 0.0,
          top: -27.0,
          right: -2.0,
          bottom: -28.0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff100f0f),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
            //margin: const EdgeInsets.fromLTRB(0.0, -27.0, -2.0, -28.0),
          ),
        ),
        Transform.rotate(
          angle: 3.1416,
          child:
              // Adobe XD layer: 'Rectangle 1' (shape)
              Positioned(
            right: -2.0,
            bottom: 100.0,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 1.0),
                  end: Alignment(0.0, -1.0),
                  colors: [Color(0x95dec77d), Color(0x00ffffff)],
                  stops: [0.0, 1.0],
                ),
              ),
              // margin: const EdgeInsets.fromLTRB(0.0, 0.0, -2.0, 100.0),
            ),
          ),
        ),
        Positioned(
          left: -182.0,
          top: 84.0,
          right: -185.0,
          bottom: -13.0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/asl_logo.png'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.04), BlendMode.dstIn),
              ),
            ),
            // margin: const EdgeInsets.fromLTRB(-182.0, 84.0, -185.0, -13.0),
          ),
        ),
        Align(
          alignment: const Alignment(0.127, 0.1),
          child: Container(
            width: 206.0,
            height: 206.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/asl_logo.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
