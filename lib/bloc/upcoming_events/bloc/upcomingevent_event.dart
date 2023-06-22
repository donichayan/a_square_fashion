part of 'upcomingevent_bloc.dart';

abstract class UpcomingeventEvent extends Equatable {
  //const UpcomingeventEvent();

}

class DatabaseFetched extends UpcomingeventEvent {
  // final Stream<QuerySnapshot> eventList;
  DatabaseFetched();

  @override
  List<Object?> get props => [];
}

class OnTapOnCard extends UpcomingeventEvent {
  final bool isSelected;
  final Events event;
  OnTapOnCard(this.isSelected, this.event);
  @override
  List<Object?> get props => [isSelected, event];
}
