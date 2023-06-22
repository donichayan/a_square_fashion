//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vie_fashion_week/bloc/upcoming_events/bloc/upcomingevent_bloc.dart';
//import 'package:vie_fashion_week/data/models/event.dart';
import 'package:vie_fashion_week/data/repositories/event_repository.dart';
import 'package:intl/intl.dart';
import 'package:vie_fashion_week/presentation/common_widgets/widgets.dart';
import '../../data/models/user.dart';
import 'user_view_details.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UpcomingEvents extends StatefulWidget {
  const UpcomingEvents({Key? key}) : super(key: key);

  @override
  State<UpcomingEvents> createState() => _UpcomingEventsState();
}

class _UpcomingEventsState extends State<UpcomingEvents> {
  final boldStyle =
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  final EventsRepository eventsRepository = EventsRepository();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpcomingeventBloc>(
      create: (context) =>
          UpcomingeventBloc(eventsRepository: eventsRepository),
      child: _bodyUpcomingEvent(),
    );
  }

  // ignore: dead_code
  Widget _bodyUpcomingEvent() {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.761, -0.835),
            end: Alignment(0.126, 0.084),
            colors: [Color(0xfff3e091), Color(0xffe4be63)],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            VieWidgets.vieAppBar('Upcoming', 'Events'),
            //const SizedBox(height: 8),
            BlocListener<UpcomingeventBloc, UpcomingeventState>(
                listener: (context, state) {
              if (state is DatabaseError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
              if (state is CallDetailPage) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserViewPage(
                            isSelected: state.isSelected, event: state.event)));
              }
              /*  if (state is DatabaseSuccess) {
          _listBuilder(state);
          } */
            }, child: BlocBuilder<UpcomingeventBloc, UpcomingeventState>(
                    builder: (context, state) {
              if (state is DatabaseSucceeded) {
                context.read<UpcomingeventBloc>().add(DatabaseFetched());
              }
              if (state is UpcomingeventInitial) {
                context.read<UpcomingeventBloc>().add(DatabaseFetched());
                return const Center(
                    child: LinearProgressIndicator(
                  color: Colors.blueGrey,
                ));
              }

              /* SingleChildScrollView(
                child: ,
              ) */

              if (state is DatabaseSucceeded) {
                return Expanded(
                    child: Container(child: _upEventBuilder(state)));
              }
              return const Center(child: CircularProgressIndicator());

              // return const Center(child: Text("Nothing to Display"));
            }))
            /* SingleChildScrollView(
                child: ,
              ) */
          ],
        ),
      ),
    );
  }

  _listBuilder(DatabaseSucceeded state) {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: state.listOfEvents.length,
        itemBuilder: (BuildContext context, int index) {
          var cardColor = _colorLogic(
              state.userEvents, state.listOfEvents[index].referenceID!);

          return Card(
            color: cardColor,
            child: InkWell(
              onTap: () => {
                context.read<UpcomingeventBloc>().add(OnTapOnCard(
                    _colorProcessing(cardColor), state.listOfEvents[index]))
              },
              child: ListTile(
                title: Text(state.listOfEvents[index].name.trim()),
                subtitle: Text(state.listOfEvents[index].venue.trim()),
                trailing: Text(DateFormat('dd-MM-yyyy')
                    .format(state.listOfEvents[index].date)
                    .toString()),
              ),
            ),
          );
        },
      ),
    );
  }

  _upEventBuilder(DatabaseSucceeded state) {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: state.listOfEvents.length,
        itemBuilder: (BuildContext context, int index) {
          var cardColor = _colorLogic(
              state.userEvents, state.listOfEvents[index].referenceID!);
          final date = DateFormat('dd-MM-yyyy')
              .format(state.listOfEvents[index].date)
              .toString();
          return Column(
            children: [
              SizedBox(
                height: 220,
                width: 330,
                child: InkWell(
                  onTap: () => {
                    context.read<UpcomingeventBloc>().add(OnTapOnCard(
                        _colorProcessing(cardColor), state.listOfEvents[index]))
                  },
                  child: VieWidgets.eventTile(
                      context,
                      state.listOfEvents[index].url.trim(),
                      state.listOfEvents[index].name.trim(),
                      state.listOfEvents[index].venue.trim(),
                      date,
                      _colorProcessing(cardColor) ? "Registered" : "Details"),
                ),
              ),
              const SizedBox(height: 5)
            ],
          );
        },
      ),
    );
  }

  _colorProcessing(dynamic color) {
    if (color == Colors.red) {
      return true;
    } else {
      return false;
    }
  }

  Object _userPic(User? user) {
    if (user?.photoURL != null) {
      return Image.network("${user?.photoURL}");
    }
    return const AssetImage('assets/images/user.png');
  }

  /*  Widget _eventTile(BuildContext context, String urlimg, String name,
      String place, String date) {
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
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Image.network(
                      urlimg,
                      fit: BoxFit.cover,
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
          Pin(size: 38.0, end: 25.0),
          Pin(size: 12.0, end: 24.0),
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                  child: Text(
                'Register',
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
          Pin(size: 17.0, middle: 0.5497),
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
          Pin(size: 17.0, middle: 0.5631),
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
  } */

  static const String _svg_he76qv =
      '<svg viewBox="0.0 6.3 18.5 16.0" ><path transform="translate(0.0, 1.46)" d="M 15.44709396362305 14.70765972137451 L 15.44709396362305 11.08505439758301 C 15.44709396362305 7.658721923828125 12.66937255859375 4.881000518798828 9.243040084838867 4.881000518798828 C 5.816707134246826 4.881000518798828 3.038985729217529 7.658721923828125 3.038985729217529 11.08505439758301 L 3.038985729217529 14.87273693084717 L 0 20.87012100219727 L 3.038985729217529 20.87012100219727 L 15.44709396362305 20.87012100219727 L 18.48608016967773 20.87012100219727 L 15.44709396362305 14.70765972137451 Z" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
  static const String _svg_oq9a97 =
      '<svg viewBox="7.0 25.2 4.5 2.8" ><path transform="translate(1.61, 5.8)" d="M 7.629693984985352 22.19201469421387 L 7.629693984985352 22.19201469421387 C 6.388362884521484 22.19201469421387 5.381000518798828 21.18595123291016 5.381000518798828 19.94332122802734 L 5.381000518798828 19.36100006103516 L 9.878386497497559 19.36100006103516 L 9.878386497497559 19.94332122802734 C 9.878386497497559 21.18595123291016 8.871025085449219 22.19201469421387 7.629693984985352 22.19201469421387" fill="#373636" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
  static const String _svg_h0g8bd =
      '<svg viewBox="9.2 0.0 12.7 12.7" ><path transform="translate(2.13, 0.0)" d="M 19.80216979980469 6.3457350730896 C 19.80216979980469 9.850057601928711 16.96205711364746 12.69016933441162 13.45773601531982 12.69016933441162 C 9.953413009643555 12.69016933441162 7.112000465393066 9.850057601928711 7.112000465393066 6.3457350730896 C 7.112000465393066 2.841412782669067 9.953413009643555 0 13.45773601531982 0 C 16.96205711364746 0 19.80216979980469 2.841412782669067 19.80216979980469 6.3457350730896" fill="#ff0000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
  static const String _svg_k8538 =
      '<svg viewBox="356.6 163.9 5.7 1.0" ><path transform="matrix(0.0, 1.0, -1.0, 0.0, 362.3, 163.94)" d="M 9.853976455145474e-21 5.727272510528564 L 0 0" fill="none" stroke="#373636" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" /></svg>';

  /* Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot snapshot) {
    final eventUp = Events.fromSnapshot(snapshot);

    return Text(eventUp.name);
  } */
  _colorLogic(List<UserEvent> userEvents, String eventID) {
    if (userEvents.isNotEmpty) {
      var available = userEvents
          .where((c) => c.eventId.trim() == eventID.trim())
          .toList()
          .length;
      if (available == 1) {
        return Colors.red;
      } else {
        return Colors.green;
      }
    } else {
      return Colors.green;
    }
    //return Colors.amber;
  }
}
