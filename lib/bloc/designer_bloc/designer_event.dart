part of 'designer_bloc.dart';

abstract class DesignerEvent extends Equatable {
  //DesignerEvent();

  @override
  List<Object> get props => [];
}

class DesignerDatabaseFetched extends DesignerEvent {
  // final Stream<QuerySnapshot> eventList;
  DesignerDatabaseFetched();

  @override
  List<Object> get props => [];
}
