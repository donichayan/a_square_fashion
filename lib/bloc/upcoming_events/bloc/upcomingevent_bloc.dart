import 'package:bloc/bloc.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:vie_fashion_week/data/models/event.dart';
import 'package:vie_fashion_week/data/models/user.dart';

import 'package:vie_fashion_week/data/repositories/event_repository.dart';

part 'upcomingevent_event.dart';
part 'upcomingevent_state.dart';

class UpcomingeventBloc extends Bloc<UpcomingeventEvent, UpcomingeventState> {
  final EventsRepository eventsRepository;
  UpcomingeventBloc({required this.eventsRepository})
      : super(UpcomingeventInitial()) {
    on<UpcomingeventEvent>((event, emit) {
      // ignore: todo
      // TODO: implement event handler
    });
    on<DatabaseFetched>(_fetchUpcomingEvents);

    on<OnTapOnCard>((event, emit) async {
      emit(Loading());
      emit(CallDetailPage(event.isSelected, event.event));
    });
  }

  _fetchUpcomingEvents(
      DatabaseFetched event, Emitter<UpcomingeventState> emit) async {
    // Stream<QuerySnapshot> eventList =  eventsRepository.getStream();
    try {
      List<Events> eventList = await eventsRepository.getEventList();
      UserFA userEvents = await eventsRepository.getUserEventList();
      while (eventList.isEmpty && userEvents.user.isEmpty) {
        emit(Loading());
      }

      // ignore: avoid_print
      // print('Event List Length: >>>> : ' + userEvents.length.toString());

      eventList.sort((a, b) => a.date.compareTo(b.date));
      emit(DatabaseSucceeded(eventList, userEvents.events));
    } on Exception catch (e) {
      emit(DatabaseError(e.toString()));
    }
  }
}
