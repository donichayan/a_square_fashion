import 'package:adobe_xd/pinned.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:vie_fashion_week/presentation/awards/awards.dart';
import 'package:vie_fashion_week/presentation/offers/offers.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/designer_bloc/designer_bloc.dart';
import '../../bloc/gallery_bloc/gallery_bloc.dart';
import '../../bloc/upcoming_events/bloc/upcomingevent_bloc.dart';
import '../common_widgets/widgets.dart';
import '../designer/designer_page.dart';
import '../gallery/gallery.dart';
import '../upcoming_events/final_upcoming.dart';

class VieDash extends StatefulWidget {
  const VieDash({Key? key}) : super(key: key);

  @override
  State<VieDash> createState() => _VieDashState();
}

class _VieDashState extends State<VieDash> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-0.761, 0.835),
            end: Alignment(0.126, 0.084),
            colors: [Color(0xfff3e08d), Color(0xffe4be63)],
            stops: [0.0, 1.0],
          ),
          border: Border.all(width: 1.0, color: const Color(0xff707070)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            VieWidgets.vieAppBar('Welcome', 'to Vie Fashion App'),
            SizedBox(
              height: 5,
            ),
            Expanded(child: _appBody(context, user)),
          ],
        ),
      ),
    );
  }
}

_awardsAreena(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return InkWell(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AwardPage()));
    },
    child: Container(
      height: size.height * 0.4,
      width: size.width * 0.93,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.all(Radius.circular(13.0)),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(13.0),
            topRight: Radius.circular(13.0),
            bottomLeft: Radius.circular(13.0),
            bottomRight: Radius.circular(13.0),
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/vieAwards.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
        //margin: EdgeInsets.fromLTRB(-46.0,23.0,58.0,9.0),
      ),
    ),
  );
}

logoCarouselBuilder() {
  return SizedBox(
    height: 80,
    width: double.infinity,
    child: CarouselSlider.builder(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: false,
          viewportFraction: 1,
          autoPlay: true,
        ),
        itemCount: (logoList.length / 2).round(),
        itemBuilder: (context, index, realIdx) {
          final int first = index * 2;
          final int second = first + 1;
          return Row(
            children: [first, second].map((idx) {
              return Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(logoList[idx], fit: BoxFit.cover),
                ),
              );
            }).toList(),
          );
        }),
  );
}

_logoCarousel() {
  return CarouselSlider(
    options: CarouselOptions(
      aspectRatio: 2.0,
      enlargeCenterPage: false,
      enableInfiniteScroll: false,
      disableCenter: true,
      viewportFraction: 0.5,
      initialPage: 2,
      autoPlay: true,
    ),
    items: imageSliders,
  );
}

_sponsorRow(BuildContext context) {
  return Row(
    children: [
      const SizedBox(
        width: 14,
      ),
      const DefaultTextStyle(
        style: TextStyle(
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'Poppins',
          fontSize: 18,
          color: Color(0xff080a24),
          fontWeight: FontWeight.w700,
          height: 2.888888888888889,
        ),
        child: Text(
          'Sponsors',
        ),
      ),
      const Spacer(
        flex: 1,
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const OfferPage()));
        },
        child: const DefaultTextStyle(
          style: TextStyle(
            leadingDistribution: TextLeadingDistribution.even,
            fontFamily: 'Montserrat-SemiBold',
            fontSize: 14,
            color: Color(0xffffffff),
            letterSpacing: 0.14,
            height: 2.2857142857142856,
          ),
          child: Text(
            'View Offers',
          ),
        ),
      ),
      SizedBox(
        width: 4,
      )
    ],
  );
}

_designerBloc(BuildContext context) {
  return BlocConsumer(
    bloc: BlocProvider.of<DesignerBloc>(context),
    builder: (context, state) {
      if (state is DesignerDatabaseSucceeded) {
        context.read<DesignerBloc>().add(DesignerDatabaseFetched());
      }
      if (state is DesignerInitial) {
        context.read<DesignerBloc>().add(DesignerDatabaseFetched());
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.amber,
          backgroundColor: Colors.black,
        ));
      }

      /* SingleChildScrollView(
                            child: ,
                          ) */

      if (state is DesignerDatabaseSucceeded) {
        return SizedBox(height: 160, child: _listDesignerBuilder(state));
        // return Container();
      }
      return const Center(child: CircularProgressIndicator());
    },
    listener: (context, state) {
      if (state is DesignerDatabaseError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errorMessage)));
      }
      if (state is DesignerCallDetailPage) {
        /* Navigator.push(
                                context,
                                 MaterialPageRoute(
                                    builder: (context) => UserViewPage(
                                        isSelected: state.isSelected, event: state.event)) );*/
      }
    },
  );
}

_designerRow(BuildContext context) {
  return Row(
    children: [
      const SizedBox(
        width: 14,
      ),
      const DefaultTextStyle(
        style: TextStyle(
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'Poppins',
          fontSize: 18,
          color: Color(0xff080a24),
          fontWeight: FontWeight.w700,
          height: 2.888888888888889,
        ),
        child: Text(
          'Designer/Brands',
        ),
      ),
      const Spacer(
        flex: 1,
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DesignerPage()));
        },
        child: const DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'Montserrat-SemiBold',
            fontSize: 14,
            color: Color(0xffffffff),
            letterSpacing: 0.14,
            height: 2.2857142857142856,
          ),
          child: Text(
            'See All',
          ),
        ),
      ),
      SizedBox(
        width: 4,
      )
    ],
  );
}

_galleryBloc(BuildContext context) {
  return BlocConsumer(
    bloc: BlocProvider.of<GalleryBloc>(context),
    builder: (context, state) {
      if (state is GalleryDatabaseSucceeded) {
        context.read<GalleryBloc>().add(GalleryDatabaseFetched());
      }
      if (state is GalleryInitial) {
        context.read<GalleryBloc>().add(GalleryDatabaseFetched());
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
          backgroundColor: Colors.amber,
        ));
      }

      /* SingleChildScrollView(
                            child: ,
                          ) */

      if (state is GalleryDatabaseSucceeded) {
        return SizedBox(height: 211, child: _listGalleryBuilder(state));
        // return Container();
      }
      return const Center(child: CircularProgressIndicator());
    },
    listener: (context, state) {
      if (state is GalleryDatabaseError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errorMessage)));
      }
      if (state is GalleryCallDetailPage) {
        /* Navigator.push(
                                context,
                                 MaterialPageRoute(
                                    builder: (context) => UserViewPage(
                                        isSelected: state.isSelected, event: state.event)) );*/
      }
    },
  );
}

_upcomingEventBloc(BuildContext context) {
  return BlocConsumer(
    bloc: BlocProvider.of<UpcomingeventBloc>(context),
    builder: (context, state) {
      if (state is DatabaseSucceeded) {
        context.read<UpcomingeventBloc>().add(DatabaseFetched());
      }
      if (state is UpcomingeventInitial) {
        context.read<UpcomingeventBloc>().add(DatabaseFetched());
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.amber,
          backgroundColor: Colors.black,
        ));
      }

      /* SingleChildScrollView(
                            child: ,
                          ) */

      if (state is DatabaseSucceeded) {
        return SizedBox(height: 211, child: _listBuilder(state));
        // return Container();
      }
      return const Center(child: CircularProgressIndicator());
    },
    listener: (context, state) {
      if (state is DatabaseError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.errorMessage)));
      }
      if (state is CallDetailPage) {
        /* Navigator.push(
                                context,
                                 MaterialPageRoute(
                                    builder: (context) => UserViewPage(
                                        isSelected: state.isSelected, event: state.event)) );*/
      }
    },
  );
}

_listBuilder(DatabaseSucceeded state) {
  return Center(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.listOfEvents.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        String date = DateFormat('dd-MM-yyyy')
            .format(state.listOfEvents[index].date)
            .toString();
        /* var cardColor = _colorLogic(
              state.userEvents, state.listOfEvents[index].referenceID!); */

        /*  return fashionTile(context, state.listOfEvents[index].venue, date,
              state.listOfEvents[index].url, state.listOfEvents[index].name); */
        return Row(
          children: [
            SizedBox(
              width: 13,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UpcomingEvents()));
              },
              child: SizedBox(
                height: 211,
                width: 172,
                child: fahsionTile(
                    context,
                    state.listOfEvents[index].venue,
                    date,
                    state.listOfEvents[index].url,
                    state.listOfEvents[index].name),
              ),
            ),
          ],
        );
      },
    ),
  );
}

_listGalleryBuilder(GalleryDatabaseSucceeded state) {
  return Center(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.listOfGallery.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        /* String date = DateFormat('dd-MM-yyyy')
            .format(state.listOfGallery[index].date)
            .toString(); */
        /* var cardColor = _colorLogic(
              state.userEvents, state.listOfEvents[index].referenceID!); */

        /*  return fashionTile(context, state.listOfEvents[index].venue, date,
              state.listOfEvents[index].url, state.listOfEvents[index].name); */
        return Row(
          children: [
            SizedBox(
              width: 13,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GalleryScreen()));
              },
              child: SizedBox(
                height: 211,
                width: 172,
                child: galleryTile(state.listOfGallery[index].name,
                    state.listOfGallery[index].url),
              ),
            ),
          ],
        );
      },
    ),
  );
}

_listDesignerBuilder(DesignerDatabaseSucceeded state) {
  return Center(
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state.listOfDesigner.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        /* String date = DateFormat('dd-MM-yyyy')
            .format(state.listOfGallery[index].date)
            .toString(); */
        /* var cardColor = _colorLogic(
              state.userEvents, state.listOfEvents[index].referenceID!); */

        /*  return fashionTile(context, state.listOfEvents[index].venue, date,
              state.listOfEvents[index].url, state.listOfEvents[index].name); */
        return Row(
          children: [
            SizedBox(
              width: 13,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GalleryScreen()));
              },
              child: SizedBox(
                height: 158,
                width: 158,
                child: designerTile(state.listOfDesigner[index].name,
                    state.listOfDesigner[index].url),
              ),
            ),
          ],
        );
      },
    ),
  );
}

_upcomingEventRow(BuildContext context) {
  return Row(
    children: [
      const SizedBox(
        width: 14,
      ),
      const DefaultTextStyle(
        style: TextStyle(
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'Poppins',
          fontSize: 18,
          color: Color(0xff080a24),
          fontWeight: FontWeight.w700,
          height: 2.888888888888889,
        ),
        child: Text(
          'Upcoming Events',
        ),
      ),
      const Spacer(
        flex: 1,
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UpcomingEvents()));
        },
        child: DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'Montserrat-SemiBold',
            fontSize: 14,
            color: Color(0xffffffff),
            letterSpacing: 0.14,
            height: 2.2857142857142856,
          ),
          child: const Text(
            'See All',
          ),
        ),
      ),
      SizedBox(
        width: 4,
      )
    ],
  );
}

_galleryRow(BuildContext context) {
  return Row(
    children: [
      const SizedBox(
        width: 14,
      ),
      const DefaultTextStyle(
        style: TextStyle(
          leadingDistribution: TextLeadingDistribution.even,
          fontFamily: 'Poppins',
          fontSize: 18,
          color: Color(0xff080a24),
          fontWeight: FontWeight.w700,
          height: 2.888888888888889,
        ),
        child: Text(
          'Gallery',
        ),
      ),
      Spacer(
        flex: 1,
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const GalleryScreen()));
        },
        child: DefaultTextStyle(
          style: TextStyle(
            fontFamily: 'Montserrat-SemiBold',
            fontSize: 14,
            color: Color(0xffffffff),
            letterSpacing: 0.14,
            height: 2.2857142857142856,
          ),
          child: Text(
            'See All',
          ),
        ),
      ),
      SizedBox(
        width: 4,
      )
    ],
  );
}

_userWidget(BuildContext context, User? user) {
  var size = MediaQuery.of(context).size;
  return Center(
    child: SizedBox(
      height: 70,
      width: size.width * 0.93,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff373636),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(width: 1.0, color: const Color(0xff45250f)),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              const DefaultTextStyle(
                child: Text('GOLD MEMBER'),
                style: TextStyle(
                  fontFamily: 'Montserrat-SemiBold',
                  fontSize: 18,
                  color: Color(0xffe4be63),
                  height: 1.2,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              DefaultTextStyle(
                child: Text('id: ${user!.email}'),
                style: const TextStyle(
                  fontFamily: 'Montserrat-Light',
                  fontSize: 17,
                  color: Color(0xffe4be63),
                  height: 1.2,
                ),
              )
            ]),
          ],
        ),
      ),
    ),
  );
}

_appBody(BuildContext context, User? user) {
  return SingleChildScrollView(
    child: ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 0.0,
        maxHeight: double.infinity,
      ),
      child: IntrinsicHeight(
        child: Column(children: [
          _userWidget(context, user),
          _upcomingEventRow(context),
          _upcomingEventBloc(context),
          _galleryRow(context),
          _galleryBloc(context),
          _designerRow(context),
          _designerBloc(context),
          const SizedBox(
            height: 40,
          ),
          _awardsAreena(context),
          _sponsorRow(context),
          // _logoCarousel(),
          logoCarouselBuilder(),
        ]),
      ),
    ),
  );
}

Widget fahsionTile(
    BuildContext context, String place, String date, String url, String name) {
  return SizedBox(
    height: 200,
    width: 160,
    child: Stack(children: [
      Container(
        height: 200,
        width: 170,
        decoration: BoxDecoration(
          //color: const Color(0xffffffff),
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
      Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 140,
                    width: 160,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.0),
                        topRight: Radius.circular(13.0),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13.0),
                          topRight: Radius.circular(13.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      //margin: EdgeInsets.fromLTRB(-46.0,23.0,58.0,9.0),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 30,
                width: 90,
                child: Container(
                  height: 30,
                  width: 90,
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: const Color(0xff292929),
                        ),
                        child: Text(
                          date,
                        ),
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(7.0),
                      bottomLeft: Radius.circular(7.0),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Text(
                          name,
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            SizedBox(
                              height: 8,
                              width: 6,
                              child: SizedBox.expand(
                                  child: SvgPicture.string(
                                _svg_e8mr51,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              )),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 9,
                                color: const Color(0xff9d9d9d),
                                fontWeight: FontWeight.w300,
                              ),
                              child: Text(place),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 17,
                        width: 22,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                height: 17,
                                width: 17,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe4be63),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                height: 17,
                                width: 17,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe4be63),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 9,
                          color: const Color(0xff9d9d9d),
                          fontWeight: FontWeight.w300,
                        ),
                        child: Text('250+ Going'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}

const String _svg_he76qv =
    '<svg viewBox="0.0 6.3 18.5 16.0" ><path transform="translate(0.0, 1.46)" d="M 15.44709396362305 14.70765972137451 L 15.44709396362305 11.08505439758301 C 15.44709396362305 7.658721923828125 12.66937255859375 4.881000518798828 9.243040084838867 4.881000518798828 C 5.816707134246826 4.881000518798828 3.038985729217529 7.658721923828125 3.038985729217529 11.08505439758301 L 3.038985729217529 14.87273693084717 L 0 20.87012100219727 L 3.038985729217529 20.87012100219727 L 15.44709396362305 20.87012100219727 L 18.48608016967773 20.87012100219727 L 15.44709396362305 14.70765972137451 Z" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_oq9a97 =
    '<svg viewBox="7.0 25.2 4.5 2.8" ><path transform="translate(1.61, 5.8)" d="M 7.629693984985352 22.19201469421387 L 7.629693984985352 22.19201469421387 C 6.388362884521484 22.19201469421387 5.381000518798828 21.18595123291016 5.381000518798828 19.94332122802734 L 5.381000518798828 19.36100006103516 L 9.878386497497559 19.36100006103516 L 9.878386497497559 19.94332122802734 C 9.878386497497559 21.18595123291016 8.871025085449219 22.19201469421387 7.629693984985352 22.19201469421387" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_h0g8bd =
    '<svg viewBox="9.2 0.0 12.7 12.7" ><path transform="translate(2.13, 0.0)" d="M 19.80216979980469 6.3457350730896 C 19.80216979980469 9.850057601928711 16.96205711364746 12.69016933441162 13.45773601531982 12.69016933441162 C 9.953413009643555 12.69016933441162 7.112000465393066 9.850057601928711 7.112000465393066 6.3457350730896 C 7.112000465393066 2.841412782669067 9.953413009643555 0 13.45773601531982 0 C 16.96205711364746 0 19.80216979980469 2.841412782669067 19.80216979980469 6.3457350730896" fill="#ff0000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_k8538 =
    '<svg viewBox="356.6 163.9 5.7 1.0" ><path transform="matrix(0.0, 1.0,1.0, 0.0, 362.3, 163.94)" d="M 9.853976455145474e-21 5.727272510528564 L 0 0" fill="none" stroke="#373636" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';
const String _svg_e8mr51 =
    '<svg viewBox="0.0 0.0 6.8 10.2" ><path  d="M 3.404032468795776 0 C 1.524098992347717 0 0 1.423736572265625 0 3.187025308609009 C 0 6.236187934875488 3.404032468795776 10.21209812164307 3.404032468795776 10.21209812164307 C 3.404032468795776 10.21209812164307 6.808064937591553 6.235336780548096 6.808064937591553 3.187025308609009 C 6.808064937591553 1.424587726593018 5.283966541290283 0 3.404032468795776 0 Z M 3.404032468795776 4.950314044952393 C 2.91657543182373 4.950314044952393 2.449088096618652 4.76819896697998 2.104146003723145 4.444815635681152 C 1.759204268455505 4.121432304382324 1.565855145454407 3.683163404464722 1.565855145454407 3.226171731948853 C 1.565855145454407 2.768329381942749 1.759204268455505 2.330060243606567 2.104146003723145 2.006677150726318 C 2.449088096618652 1.683294057846069 2.91657543182373 1.501178383827209 3.404032468795776 1.501178383827209 C 3.891490459442139 1.501178383827209 4.358977317810059 1.683294057846069 4.703919410705566 2.006677150726318 C 5.048861026763916 2.330060243606567 5.242210388183594 2.768329381942749 5.242210388183594 3.226171731948853 C 5.242210388183594 3.683163404464722 5.048861026763916 4.121432304382324 4.703919410705566 4.444815635681152 C 4.358977317810059 4.76819896697998 3.891490459442139 4.950314044952393 3.404032468795776 4.950314044952393 Z" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';

Widget galleryTile(String event, String url) {
  return SizedBox(
    height: 200,
    width: 160,
    child: Stack(children: [
      Container(
        height: 200,
        width: 170,
        decoration: BoxDecoration(
          //color: const Color(0xffffffff),
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
      Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 130,
                    width: 160,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13.0),
                        topRight: Radius.circular(13.0),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(13.0),
                          topRight: Radius.circular(13.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      //margin: EdgeInsets.fromLTRB(-46.0,23.0,58.0,9.0),
                    ),
                  ),
                ],
              ),
            ),
            /*  Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: 30,
                width: 90,
                child: Container(
                  height: 30,
                  width: 90,
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: const Color(0xff292929),
                        ),
                        child: Text(
                          "<-date->",
                        ),
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(7.0),
                      bottomLeft: Radius.circular(7.0),
                    ),
                  ),
                ),
              ),
            ), */
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Text(
                          event,
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            SizedBox(
                              height: 8,
                              width: 6,
                              child: SizedBox.expand(
                                  child: SvgPicture.string(
                                _svg_e8mr51,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
                              )),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            DefaultTextStyle(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 9,
                                color: const Color(0xff9d9d9d),
                                fontWeight: FontWeight.w300,
                              ),
                              child: Text('Dubai'),
                            ),
                          ],
                        ),
                      ),
                      /*  SizedBox(
                        height: 17,
                        width: 22,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                height: 17,
                                width: 17,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe4be63),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                height: 17,
                                width: 17,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe4be63),
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    border: Border.all(
                                        width: 1.0,
                                        color: const Color(0xffffffff)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 9,
                          color: const Color(0xff9d9d9d),
                          fontWeight: FontWeight.w300,
                        ),
                        child: Text('250+ Going'),
                      ), */
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}

Widget designerTile(String event, String url) {
  return SizedBox(
    height: 160,
    width: 160,
    child: Stack(children: [
      Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          //color: const Color(0xffffffff),
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
      Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 125,
                    width: 148,
                    decoration: const BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: Radius.circular(18.0),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: Radius.circular(18.0),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      //margin: EdgeInsets.fromLTRB(-46.0,23.0,58.0,9.0),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  SizedBox(
                    height: 133,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: _fontSize(event),
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Text(
                          event,
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}

double _fontSize(String name) {
  if (name.length > 22) {
    return 10;
  } else {
    return 15;
  }
}

final List<String> logoList = [
  'assets/sponsors/citibank-logo.jpg',
  'assets/sponsors/cristyle-logo.jpg',
  'assets/sponsors/dailymail.jpg',
  'assets/sponsors/dxblive-logo.jpg',
  'assets/sponsors/fashiontv-logo.jpg',
  'assets/sponsors/fomo-logo.jpg',
  'assets/sponsors/graameen-80.jpg',
  'assets/sponsors/grazia-logo.jpg',
  'assets/sponsors/imossi-80.jpg',
  'assets/sponsors/itl-world-80.jpg',
  'assets/sponsors/ktdc-80.jpg',
  'assets/sponsors/lovin-dubai-logo.jpg',
  'assets/sponsors/miceminds-80.jpg',
  'assets/sponsors/missengland-80.jpg',
  'assets/sponsors/myg-80.jpg',
  'assets/sponsors/paramount-dubai-logo.jpg',
  'assets/sponsors/scorpio-80.jpg',
  'assets/sponsors/top-fashion-model-logo.jpg',
  'assets/sponsors/tourism-malaysia-logo.jpg',
  'assets/sponsors/trino-fashion-week-logo.jpg',
];
final List<Widget> imageSliders = logoList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.fill, width: 150.0),
                  /*  Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    'No. ${logoList.indexOf(item)} image',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ), */
                ],
              )),
        ))
    .toList();

String urlIe =
    'https://images.pexels.com/photos/62689/pexels-photo-62689.jpeg?cs=srgb&dl=pexels-ovan-62689.jpg&fm=jpg';
/* designerTile('test',
              'https://images.pexels.com/photos/1153369/pexels-photo-1153369.jpeg?cs=srgb&dl=pexels-nathan-cowley-1153369.jpg&fm=jpg'),
          SizedBox(
            height: 10,
          ),
          galleryTile('test',
              'https://images.pexels.com/photos/62689/pexels-photo-62689.jpeg?cs=srgb&dl=pexels-ovan-62689.jpg&fm=jpg'),
 */