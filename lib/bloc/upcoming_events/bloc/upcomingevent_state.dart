part of 'upcomingevent_bloc.dart';

abstract class UpcomingeventState extends Equatable {
  const UpcomingeventState();
  @override
  List<Object?> get props => [];
}

class UpcomingeventInitial extends UpcomingeventState {
  @override
  List<Object?> get props => [];
}

class Loading extends UpcomingeventState {
  @override
  List<Object?> get props => [];
}

class CallDetailPage extends UpcomingeventState {
  final bool isSelected;
  final Events event;
  const CallDetailPage(this.isSelected, this.event);
  @override
  List<Object?> get props => [];
}

class DatabaseSucceeded extends UpcomingeventState {
  final List<Events> listOfEvents;
  final List<UserEvent> userEvents;

  const DatabaseSucceeded(this.listOfEvents, this.userEvents);

  @override
  List<Object?> get props => [listOfEvents, userEvents];
}

class DatabaseError extends UpcomingeventState {
  final String errorMessage;
  const DatabaseError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}
