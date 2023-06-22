import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vie_fashion_week/data/repositories/designer_repository.dart';

import '../../data/models/designer.dart';

part 'designer_event.dart';
part 'designer_state.dart';

class DesignerBloc extends Bloc<DesignerEvent, DesignerState> {
  final DesignerRepository designerRepository;
  DesignerBloc({required this.designerRepository}) : super(DesignerInitial()) {
    on<DesignerEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<DesignerDatabaseFetched>(_fetchDesigner);
  }
  _fetchDesigner(
      DesignerDatabaseFetched event, Emitter<DesignerState> emit) async {
    // Stream<QuerySnapshot> eventList =  eventsRepository.getStream();
    try {
      List<DesignerModel> designerList =
          await designerRepository.getEventList();
      //UserFA userEvents = await eventsRepository.getUserEventList();
      while (designerList.isEmpty) {
        emit(DesignerLoading());
      }

      // ignore: avoid_print
      // print('Event List Length: >>>> : ' + userEvents.length.toString());

      //eventList.sort((a, b) => a.date.compareTo(b.date));
      emit(DesignerDatabaseSucceeded(designerList));
    } on Exception catch (e) {
      emit(DesignerDatabaseError(e.toString()));
    }
  }
}
