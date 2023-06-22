import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class XDImage extends StatelessWidget {
  XDImage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(startFraction: -5.3545, endFraction: -3.259),
              Pin(startFraction: -1.0262, endFraction: -4.3859),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(startFraction: 0.0, endFraction: 0.0),
                    Pin(startFraction: 0.0, endFraction: 0.0),
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(startFraction: 0.0, endFraction: 0.2549),
                          Pin(startFraction: 0.0, endFraction: 0.3658),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/vie_logo_wm.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(startFraction: 0.0, endFraction: 0.0),
                          Pin(startFraction: 0.0, endFraction: 0.0),
                          child: Container(
                            decoration: BoxDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(startFraction: 0.0, endFraction: 0.0),
              Pin(startFraction: 0.0, endFraction: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17.1),
                    topRight: Radius.circular(17.1),
                    bottomRight: Radius.circular(17.1),
                    bottomLeft: Radius.circular(17.11),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
