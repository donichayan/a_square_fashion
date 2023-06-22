import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VieWidgets {
  static Widget vieAppBar(String salute, String appState) {
    return Column(
      children: [
        Builder(builder: (context) {
          return Container(
            height: 50,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Color(0xff161615),
                            height: 1.2,
                          ),
                          children: [
                            TextSpan(
                              text: '$salute \n',
                              style: TextStyle(
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            TextSpan(
                              text: appState,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Center(
                      child: SizedBox(
                        child: Align(
                          child: Stack(
                            children: <Widget>[
                              Pinned.fromPins(
                                Pin(size: 18.5, start: 0.0),
                                Pin(start: 6.3, end: 5.7),
                                child: SvgPicture.string(
                                  _svg_he76qv,
                                  allowDrawingOutsideViewBox: true,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: const Alignment(-0.198, 1.0),
                                child: SizedBox(
                                  width: 4.0,
                                  height: 3.0,
                                  child: SvgPicture.string(
                                    _svg_oq9a97,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ),
                              /*  Align(
                                alignment: Alignment.topRight,
                                child: SizedBox(
                                  width: 13.0,
                                  height: 13.0,
                                  child: SvgPicture.string(
                                    _svg_h0g8bd,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ), */
                              Container(
                                decoration: BoxDecoration(),
                              ),
                            ],
                          ),
                        ),
                        height: 30,
                        width: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ],
    );
  }

  static Widget designerTile(BuildContext context, String urlimg, String name,
      String place, String date, String buttonText) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Shape' (shape)
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0x0a000000),
                offset: Offset(0, 3),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        /*  Pinned.fromPins(
          Pin(size: 69.0, end: 11.0),
          Pin(size: 22.0, end: 19.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffeed580),
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
        ), */
        Pinned.fromPins(
          Pin(start: 8.0, end: 11.0),
          Pin(size: 160.0, start: 8.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.0),
                    topRight: Radius.circular(14.0),
                  ),
                ),
              ),
              Positioned(
                top: -0.0,
                right: -19.0,
                bottom: -0.0,
                left: -16.0,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      height: 134,
                      width: 260,
                      child: Image.network(
                        urlimg,
                        fit: BoxFit.cover,
                        width: 300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 180.0, start: 8.0),
          Pin(size: 20.0, middle: 0.9),
          child: Text(
            name,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xff292929),
              fontWeight: FontWeight.w600,
              height: 3.5,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
        /*  Pinned.fromPins(
          Pin(size: 54.0, start: 8.0),
          Pin(size: 12.0, end: 21.5),
          child: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(size: 6.8, start: 0.0),
                Pin(start: 0.2, end: 1.6),
                child:
                    // Adobe XD layer: 'Vector Smart Object' (group)
                    Stack(
                  children: <Widget>[
                    SizedBox.expand(
                        child: SvgPicture.string(
                      '<svg viewBox="0.0 0.0 6.8 10.2" ><path  d="M 3.404032468795776 0 C 1.524098992347717 0 0 1.423736572265625 0 3.187025308609009 C 0 6.236187934875488 3.404032468795776 10.21209812164307 3.404032468795776 10.21209812164307 C 3.404032468795776 10.21209812164307 6.808064937591553 6.235336780548096 6.808064937591553 3.187025308609009 C 6.808064937591553 1.424587726593018 5.283966541290283 0 3.404032468795776 0 Z M 3.404032468795776 4.950314044952393 C 2.91657543182373 4.950314044952393 2.449088096618652 4.76819896697998 2.104146003723145 4.444815635681152 C 1.759204268455505 4.121432304382324 1.565855145454407 3.683163404464722 1.565855145454407 3.226171731948853 C 1.565855145454407 2.768329381942749 1.759204268455505 2.330060243606567 2.104146003723145 2.006677150726318 C 2.449088096618652 1.683294057846069 2.91657543182373 1.501178383827209 3.404032468795776 1.501178383827209 C 3.891490459442139 1.501178383827209 4.358977317810059 1.683294057846069 4.703919410705566 2.006677150726318 C 5.048861026763916 2.330060243606567 5.242210388183594 2.768329381942749 5.242210388183594 3.226171731948853 C 5.242210388183594 3.683163404464722 5.048861026763916 4.121432304382324 4.703919410705566 4.444815635681152 C 4.358977317810059 4.76819896697998 3.891490459442139 4.950314044952393 3.404032468795776 4.950314044952393 Z" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    )),
                  ],
                ),
              ),
              Pinned.fromPins(
                Pin(size: 42.0, end: 0.0),
                Pin(start: 0.0, end: 0.0),
                child: Text(
                  place,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 9,
                    color: const Color(0xff9d9d9d),
                    fontWeight: FontWeight.w300,
                    height: 5.333333333333333,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 45.0, end: 25.0),
          Pin(size: 12.0, end: 24.0),
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                  child: Text(
                buttonText,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 9,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  height: 5.333333333333333,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              )),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 17.0, middle: 0.5350),
          Pin(size: 17.0, end: 21.5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffe4be63),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              border: Border.all(width: 1.0, color: const Color(0xffffffff)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 17.0, middle: 0.5479),
          Pin(size: 17.0, end: 21.5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffe4be63),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              border: Border.all(width: 1.0, color: const Color(0xffffffff)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 51.0, middle: 0.6785),
          Pin(size: 12.0, end: 23.5),
          child: Text(
            '250+ Going',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 9,
              color: const Color(0xff9d9d9d),
              fontWeight: FontWeight.w300,
              height: 5.333333333333333,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
        Pinned.fromPins( 
          Pin(size: 70.0, middle: 0.3125),
          Pin(size: 12.0, end: 23.0),
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                  child: Text(
                date.toString(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 9,
                  color: const Color(0xff292929),
                  fontWeight: FontWeight.w300,
                  height: 3.5555555555555554,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              )),
            ],
          ),
        ),*/
      ],
    );
  }

  static Widget eventTile(BuildContext context, String urlimg, String name,
      String place, String date, String buttonText) {
    return Stack(
      children: <Widget>[
        // Adobe XD layer: 'Shape' (shape)
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0x0a000000),
                offset: Offset(0, 3),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 69.0, end: 11.0),
          Pin(size: 22.0, end: 19.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffeed580),
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 8.0, end: 11.0),
          Pin(size: 134.0, start: 8.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.0),
                    topRight: Radius.circular(14.0),
                  ),
                ),
              ),
              Positioned(
                top: -0.0,
                right: -19.0,
                bottom: -0.0,
                left: -16.0,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      height: 100,
                      width: 230,
                      child: Image.network(
                        urlimg,
                        fit: BoxFit.cover,
                        width: 300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 108.0, start: 8.0),
          Pin(size: 20.0, middle: 0.7831),
          child: Text(
            name,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xff292929),
              fontWeight: FontWeight.w600,
              height: 3.5,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
        Pinned.fromPins(
          Pin(size: 54.0, start: 8.0),
          Pin(size: 12.0, end: 21.5),
          child: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(size: 6.8, start: 0.0),
                Pin(start: 0.2, end: 1.6),
                child:
                    // Adobe XD layer: 'Vector Smart Object' (group)
                    Stack(
                  children: <Widget>[
                    SizedBox.expand(
                        child: SvgPicture.string(
                      '<svg viewBox="0.0 0.0 6.8 10.2" ><path  d="M 3.404032468795776 0 C 1.524098992347717 0 0 1.423736572265625 0 3.187025308609009 C 0 6.236187934875488 3.404032468795776 10.21209812164307 3.404032468795776 10.21209812164307 C 3.404032468795776 10.21209812164307 6.808064937591553 6.235336780548096 6.808064937591553 3.187025308609009 C 6.808064937591553 1.424587726593018 5.283966541290283 0 3.404032468795776 0 Z M 3.404032468795776 4.950314044952393 C 2.91657543182373 4.950314044952393 2.449088096618652 4.76819896697998 2.104146003723145 4.444815635681152 C 1.759204268455505 4.121432304382324 1.565855145454407 3.683163404464722 1.565855145454407 3.226171731948853 C 1.565855145454407 2.768329381942749 1.759204268455505 2.330060243606567 2.104146003723145 2.006677150726318 C 2.449088096618652 1.683294057846069 2.91657543182373 1.501178383827209 3.404032468795776 1.501178383827209 C 3.891490459442139 1.501178383827209 4.358977317810059 1.683294057846069 4.703919410705566 2.006677150726318 C 5.048861026763916 2.330060243606567 5.242210388183594 2.768329381942749 5.242210388183594 3.226171731948853 C 5.242210388183594 3.683163404464722 5.048861026763916 4.121432304382324 4.703919410705566 4.444815635681152 C 4.358977317810059 4.76819896697998 3.891490459442139 4.950314044952393 3.404032468795776 4.950314044952393 Z" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    )),
                  ],
                ),
              ),
              Pinned.fromPins(
                Pin(size: 42.0, end: 0.0),
                Pin(start: 0.0, end: 0.0),
                child: Text(
                  place,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 9,
                    color: const Color(0xff9d9d9d),
                    fontWeight: FontWeight.w300,
                    height: 5.333333333333333,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 45.0, end: 25.0),
          Pin(size: 12.0, end: 24.0),
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                  child: Text(
                buttonText,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 9,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w700,
                  height: 5.333333333333333,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              )),
            ],
          ),
        ),
        Pinned.fromPins(
          Pin(size: 17.0, middle: 0.5350),
          Pin(size: 17.0, end: 21.5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffe4be63),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              border: Border.all(width: 1.0, color: const Color(0xffffffff)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 17.0, middle: 0.5479),
          Pin(size: 17.0, end: 21.5),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffe4be63),
              borderRadius: BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              border: Border.all(width: 1.0, color: const Color(0xffffffff)),
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(size: 51.0, middle: 0.6785),
          Pin(size: 12.0, end: 23.5),
          child: Text(
            '250+ Going',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 9,
              color: const Color(0xff9d9d9d),
              fontWeight: FontWeight.w300,
              height: 5.333333333333333,
            ),
            textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),
        ),
        Pinned.fromPins(
          Pin(size: 70.0, middle: 0.3125),
          Pin(size: 12.0, end: 23.0),
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                  child: Text(
                date.toString(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 9,
                  color: const Color(0xff292929),
                  fontWeight: FontWeight.w300,
                  height: 3.5555555555555554,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              )),
            ],
          ),
        ),
      ],
    );
  }

  static Widget appFooter() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.761, -0.835),
          end: Alignment(0.126, 0.084),
          colors: [Color(0xfff3e08d), Color(0xffe4be63)],
          stops: [0.0, 1.0],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(32.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(0, 3),
                  blurRadius: 20,
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 21.6, start: 39.0),
            Pin(size: 24.0, middle: 0.5),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  '<svg viewBox="53.0 753.0 21.6 24.0" ><path transform="translate(50.0, 751.02)" d="M 23.4000186920166 9.196146965026855 L 23.4000186920166 9.196146965026855 L 16.20001983642578 2.891690731048584 C 14.83345699310303 1.670860171318054 12.76658248901367 1.670859694480896 11.4000186920166 2.891690254211426 L 4.200019359588623 9.196146965026855 C 3.428952932357788 9.884927749633789 2.991796493530273 10.87172031402588 3.000019550323486 11.9049072265625 L 3.000019073486328 22.38036918640137 C 3.000019073486328 24.3662166595459 4.611794471740723 25.97606658935547 6.600019454956055 25.97606658935547 L 21.00001907348633 25.97606658935547 C 22.98824501037598 25.97606658935547 24.60001945495605 24.3662166595459 24.60001945495605 22.38036918640137 L 24.60001945495605 11.89292144775391 C 24.60479164123535 10.86390590667725 24.16793632507324 9.882155418395996 23.4000186920166 9.196147918701172 Z M 16.20001983642578 23.57893371582031 L 11.4000186920166 23.57893371582031 L 11.4000186920166 17.58610725402832 C 11.4000186920166 16.92415618896484 11.93727779388428 16.38754081726074 12.60001945495605 16.38754081726074 L 15.00001907348633 16.38754081726074 C 15.66276168823242 16.38754081726074 16.20001983642578 16.92415809631348 16.20001983642578 17.58610725402832 L 16.20001983642578 23.57893371582031 Z M 22.20001983642578 22.38036918640137 C 22.20001983642578 23.04231643676758 21.66275978088379 23.57893371582031 21.00001907348633 23.57893371582031 L 18.60001945495605 23.57893371582031 L 18.60001945495605 17.58610725402832 C 18.60001945495605 15.60025882720947 16.98824501037598 13.99040985107422 15.00001907348633 13.99040985107422 L 12.60001945495605 13.99040985107422 C 10.61179351806641 13.99040985107422 9.000018119812012 15.60025978088379 9.000019073486328 17.58610725402832 L 9.000019073486328 23.57893371582031 L 6.600019454956055 23.57893371582031 C 5.937277793884277 23.57893371582031 5.40001916885376 23.04231643676758 5.40001916885376 22.38036918640137 L 5.40001916885376 11.89292144775391 C 5.400455951690674 11.548659324646 5.549078941345215 11.22120761871338 5.808019638061523 10.99399662017822 L 13.00801944732666 4.701525211334229 C 13.46102714538574 4.304025173187256 14.13901138305664 4.304025173187256 14.59201908111572 4.701525211334229 L 21.79201889038086 10.99399662017822 C 22.05096054077148 11.2212085723877 22.19958305358887 11.54866123199463 22.20001983642578 11.89292144775391 L 22.20001983642578 22.38036918640137 Z" fill="#3c94ff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0.006, 0.0),
            child: SizedBox(
              width: 20.0,
              height: 24.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    '<svg viewBox="136.0 753.0 20.0 24.0" ><path transform="translate(134.0, 751.0)" d="M 19 4.400000095367432 L 17 4.400000095367432 L 17 3.200000047683716 C 17 2.537258386611938 16.55228424072266 2 16 2 C 15.44771480560303 2 15 2.537258386611938 15 3.200000047683716 L 15 4.400000095367432 L 9 4.400000095367432 L 9 3.200000047683716 C 9 2.537258386611938 8.552284240722656 2 8 2 C 7.447715282440186 2 7 2.537258386611938 7 3.200000047683716 L 7 4.400000095367432 L 5 4.400000095367432 C 3.343145608901978 4.40000057220459 1.999999523162842 6.011776447296143 2 8.000001907348633 L 2 22.40000152587891 C 2 24.38822746276855 3.343145847320557 26.00000190734863 5 26.00000190734863 L 19 26.00000190734863 C 20.6568546295166 26.00000190734863 22 24.38822746276855 22 22.40000152587891 L 22 8.000000953674316 C 22 6.011775970458984 20.6568546295166 4.40000057220459 19 4.40000057220459 Z M 20 22.40000152587891 C 20 23.06274223327637 19.55228424072266 23.60000038146973 19 23.60000038146973 L 5 23.60000038146973 C 4.447715282440186 23.60000038146973 4 23.06274223327637 4 22.40000152587891 L 4 14.00000095367432 L 20 14.00000095367432 L 20 22.40000152587891 Z M 20 11.60000038146973 L 4 11.60000038146973 L 4 8.000000953674316 C 4 7.337258338928223 4.447715282440186 6.800000190734863 5 6.800000190734863 L 7 6.800000190734863 L 7 8.000000953674316 C 7 8.662742614746094 7.447715282440186 9.200000762939453 8 9.200000762939453 C 8.552285194396973 9.200000762939453 9 8.662742614746094 9 8.000000953674316 L 9 6.800000190734863 L 15 6.800000190734863 L 15 8.000000953674316 C 15 8.662742614746094 15.44771575927734 9.200000762939453 16 9.200000762939453 C 16.55228424072266 9.200000762939453 17 8.662742614746094 17 8.000000953674316 L 17 6.800000190734863 L 19 6.800000190734863 C 19.55228424072266 6.800000190734863 20 7.337258338928223 20 8.000000953674316 L 20 11.60000038146973 Z" fill="#3c94ff" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ],
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(size: 24.0, end: 35.0),
            Pin(size: 24.0, middle: 0.5),
            child: Stack(
              children: <Widget>[
                SizedBox.expand(
                    child: SvgPicture.string(
                  '<svg viewBox="0.5 0.5 24.0 24.0" ><path  d="M 12.5 0.5 C 5.883068084716797 0.5 0.5 5.883068084716797 0.5 12.5 C 0.5 19.11693382263184 5.883068084716797 24.5 12.5 24.5 C 19.11693382263184 24.5 24.5 19.11695671081543 24.5 12.5 C 24.5 5.883045196533203 19.11695671081543 0.5 12.5 0.5 Z M 12.5 22.17741966247559 C 9.947863578796387 22.17741966247559 7.63019847869873 21.17707633972168 5.899318695068359 19.5571460723877 C 6.211806774139404 18.97640800476074 6.635848045349121 18.44877815246582 7.158041000366211 17.98900985717773 C 8.489676475524902 16.81225776672363 10.41741943359375 16.09225654602051 12.5 16.09225654602051 C 14.96192741394043 16.09225654602051 17.20711326599121 17.09870147705078 18.5 18.67803955078125 C 18.73489761352539 18.95437240600586 18.92555999755859 19.2542896270752 19.09307289123535 19.5640811920166 C 17.36294174194336 21.17987251281738 15.04841327667236 22.17741966247559 12.5 22.17741966247559 Z M 20.66410064697266 17.67409133911133 C 18.99432373046875 15.28477478027344 15.93703269958496 13.76967620849609 12.5 13.76967620849609 C 9.059274673461914 13.76967620849609 5.999777793884277 15.28791618347168 4.342322826385498 17.68463325500488 C 3.385125637054443 16.18392181396484 2.822580814361572 14.40815448760986 2.822580814361572 12.5 C 2.822580814361572 7.163808822631836 7.163808822631836 2.822580814361572 12.5 2.822580814361572 C 17.83619117736816 2.822580814361572 22.17741966247559 7.163808822631836 22.17741966247559 12.5 C 22.17741966247559 14.40374183654785 21.61721038818359 16.17556190490723 20.66410064697266 17.67409133911133 Z" fill="#3c94ff" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                )),
                Align(
                  alignment: Alignment(0.0, -0.475),
                  child: SizedBox(
                    width: 6.0,
                    height: 6.0,
                    child: SvgPicture.string(
                      '<svg viewBox="9.3 5.1 6.4 6.4" ><path transform="translate(-1.74, -0.91)" d="M 14.24016380310059 6.025390148162842 C 12.46743392944336 6.025390148162842 11.025390625 7.467433929443359 11.025390625 9.240163803100586 C 11.025390625 11.0128927230835 12.46740818023682 12.45493030548096 14.24016380310059 12.45493030548096 C 16.01292037963867 12.45493030548096 17.45493125915527 11.01291942596436 17.45493125915527 9.240163803100586 C 17.45493125915527 7.467408180236816 16.01292037963867 6.025390148162842 14.24016380310059 6.025390148162842 Z M 14.24016380310059 10.51622200012207 C 13.53649616241455 10.51622200012207 12.96409893035889 9.94382381439209 12.96409893035889 9.240157127380371 C 12.96409893035889 8.536489486694336 13.53647708892822 7.964098930358887 14.24016380310059 7.964098930358887 C 14.94385051727295 7.964098930358887 15.51622200012207 8.536496162414551 15.51622200012207 9.240163803100586 C 15.51622200012207 9.943831443786621 14.94385051727295 10.51622200012207 14.24016380310059 10.51622200012207 Z" fill="#3c94ff" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0.392, 0.0),
            child: SizedBox(
              width: 26.0,
              height: 24.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    '<svg viewBox="216.4 753.1 26.3 24.0" ><path transform="translate(214.62, 750.09)" d="M 20.31559562683105 3.000000476837158 C 18.27724647521973 3.001794576644897 16.32303619384766 3.812975883483887 14.88260269165039 5.255206108093262 C 11.88212299346924 2.250829219818115 7.014224529266357 2.247960567474365 4.010027408599854 5.248620510101318 C 1.005829811096191 8.249277114868164 1.002961158752441 13.11717700958252 4.003621101379395 16.12137603759766 L 14.88260078430176 26.99999809265137 L 25.76140403747559 16.12119674682617 C 27.95900917053223 13.92085456848145 28.61464309692383 10.61330604553223 27.42254447937012 7.741048336029053 C 26.23044395446777 4.868790626525879 23.4254150390625 2.997552871704102 20.31559562683105 3.000000476837158 Z M 23.94186401367188 14.31446838378906 L 14.88260078430176 23.37373161315918 L 5.823338985443115 14.31446838378906 C 3.820606708526611 12.31173419952393 3.82060718536377 9.064662933349609 5.823339462280273 7.061931133270264 C 7.826070308685303 5.059200286865234 11.07314109802246 5.059200286865234 13.07587432861328 7.06193208694458 L 14.88260078430176 8.881473541259766 L 16.68932723999023 7.074747085571289 C 18.71912574768066 5.13845682144165 21.91206741333008 5.138458251953125 23.94186401367188 7.074747562408447 C 24.90430641174316 8.036123275756836 25.44509315490723 9.340669631958008 25.44509315490723 10.70101451873779 C 25.44509315490723 12.06136035919189 24.90430641174316 13.36590671539307 23.94186401367188 14.32728099822998 Z" fill="#3c94ff" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.379, 0.0),
            child: SizedBox(
              width: 26.0,
              height: 26.0,
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                      child: SvgPicture.string(
                    '<svg viewBox="0.0 0.0 26.0 26.0" ><path  d="M 0 0 L 26 0 L 26 26 L 0 26 L 0 0 Z" fill="none" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                    allowDrawingOutsideViewBox: true,
                    fit: BoxFit.fill,
                  )),
                  Padding(
                    padding: EdgeInsets.all(2.2),
                    child: SizedBox.expand(
                        child: SvgPicture.string(
                      '<svg viewBox="2.2 2.2 21.7 21.7" ><path transform="translate(0.17, 0.17)" d="M 12.83333301544189 2 C 6.853333950042725 2 2 6.853333950042725 2 12.83333301544189 C 2 18.81333541870117 6.853333950042725 23.66666793823242 12.83333301544189 23.66666793823242 C 18.81333541870117 23.66666793823242 23.66666793823242 18.81333541870117 23.66666793823242 12.83333301544189 C 23.66666793823242 6.853333473205566 18.81333541870117 2 12.83333301544189 2 Z M 12.83333301544189 21.50000190734863 C 8.05583381652832 21.50000190734863 4.166666984558105 17.6108341217041 4.166666984558105 12.83333301544189 C 4.166666984558105 8.05583381652832 8.05583381652832 4.166666984558105 12.83333301544189 4.166666984558105 C 17.6108341217041 4.166666984558105 21.50000190734863 8.05583381652832 21.50000190734863 12.83333301544189 C 21.50000190734863 17.6108341217041 17.6108341217041 21.50000190734863 12.83333301544189 21.50000190734863 Z M 6.875000476837158 18.79166793823242 L 15.01083374023438 15.01083374023438 L 18.79166793823242 6.875000476837158 L 10.65583324432373 10.65583324432373 L 6.875000476837158 18.79166793823242 Z M 12.83333301544189 11.64166641235352 C 13.49416637420654 11.64166641235352 14.02500057220459 12.17249965667725 14.02500057220459 12.83333301544189 C 14.02500057220459 13.49416732788086 13.49416732788086 14.02500057220459 12.83333301544189 14.02500057220459 C 12.17249965667725 14.02500057220459 11.64166641235352 13.49416732788086 11.64166641235352 12.83333301544189 C 11.64166641235352 12.17249965667725 12.17249965667725 11.64166641235352 12.83333301544189 11.64166641235352 Z" fill="#3c94ff" fill-opacity="0.4" stroke="none" stroke-width="1" stroke-opacity="0.4" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.fill,
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_he76qv =
    '<svg viewBox="0.0 6.3 18.5 16.0" ><path transform="translate(0.0, 1.46)" d="M 15.44709396362305 14.70765972137451 L 15.44709396362305 11.08505439758301 C 15.44709396362305 7.658721923828125 12.66937255859375 4.881000518798828 9.243040084838867 4.881000518798828 C 5.816707134246826 4.881000518798828 3.038985729217529 7.658721923828125 3.038985729217529 11.08505439758301 L 3.038985729217529 14.87273693084717 L 0 20.87012100219727 L 3.038985729217529 20.87012100219727 L 15.44709396362305 20.87012100219727 L 18.48608016967773 20.87012100219727 L 15.44709396362305 14.70765972137451 Z" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_oq9a97 =
    '<svg viewBox="7.0 25.2 4.5 2.8" ><path transform="translate(1.61, 5.8)" d="M 7.629693984985352 22.19201469421387 L 7.629693984985352 22.19201469421387 C 6.388362884521484 22.19201469421387 5.381000518798828 21.18595123291016 5.381000518798828 19.94332122802734 L 5.381000518798828 19.36100006103516 L 9.878386497497559 19.36100006103516 L 9.878386497497559 19.94332122802734 C 9.878386497497559 21.18595123291016 8.871025085449219 22.19201469421387 7.629693984985352 22.19201469421387" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_h0g8bd =
    '<svg viewBox="9.2 0.0 12.7 12.7" ><path transform="translate(2.13, 0.0)" d="M 19.80216979980469 6.3457350730896 C 19.80216979980469 9.850057601928711 16.96205711364746 12.69016933441162 13.45773601531982 12.69016933441162 C 9.953413009643555 12.69016933441162 7.112000465393066 9.850057601928711 7.112000465393066 6.3457350730896 C 7.112000465393066 2.841412782669067 9.953413009643555 0 13.45773601531982 0 C 16.96205711364746 0 19.80216979980469 2.841412782669067 19.80216979980469 6.3457350730896" fill="#ff0000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_k8538 =
    '<svg viewBox="356.6 163.9 5.7 1.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 362.3, 163.94)" d="M 9.853976455145474e-21 5.727272510528564 L 0 0" fill="none" stroke="#373636" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_e8mr51 =
    '<svg viewBox="0.0 0.0 6.8 10.2" ><path  d="M 3.404032468795776 0 C 1.524098992347717 0 0 1.423736572265625 0 3.187025308609009 C 0 6.236187934875488 3.404032468795776 10.21209812164307 3.404032468795776 10.21209812164307 C 3.404032468795776 10.21209812164307 6.808064937591553 6.235336780548096 6.808064937591553 3.187025308609009 C 6.808064937591553 1.424587726593018 5.283966541290283 0 3.404032468795776 0 Z M 3.404032468795776 4.950314044952393 C 2.91657543182373 4.950314044952393 2.449088096618652 4.76819896697998 2.104146003723145 4.444815635681152 C 1.759204268455505 4.121432304382324 1.565855145454407 3.683163404464722 1.565855145454407 3.226171731948853 C 1.565855145454407 2.768329381942749 1.759204268455505 2.330060243606567 2.104146003723145 2.006677150726318 C 2.449088096618652 1.683294057846069 2.91657543182373 1.501178383827209 3.404032468795776 1.501178383827209 C 3.891490459442139 1.501178383827209 4.358977317810059 1.683294057846069 4.703919410705566 2.006677150726318 C 5.048861026763916 2.330060243606567 5.242210388183594 2.768329381942749 5.242210388183594 3.226171731948853 C 5.242210388183594 3.683163404464722 5.048861026763916 4.121432304382324 4.703919410705566 4.444815635681152 C 4.358977317810059 4.76819896697998 3.891490459442139 4.950314044952393 3.404032468795776 4.950314044952393 Z" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
