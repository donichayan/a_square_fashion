import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/user.dart';
import '../../../../data/repositories/event_repository.dart';

part 'detail_page_event.dart';
part 'detail_page_state.dart';

class DetailPageBloc extends Bloc<DetailPageEvent, DetailPageState> {
  final EventsRepository eventsRepository;
  DetailPageBloc({required this.eventsRepository})
      : super(DetailPageInitial()) {
    on<DetailPageEvent>((event, emit) {
      // ignore: todo
      // TODO: implement event handler
    });
    on<OnPageLoad>((event, emit) async {
      UserFA userFA = await eventsRepository.getUser();
      while (userFA.user.isEmpty) {
        emit(Loading());
      }
      emit(AfterPageLoad(userFA));
    });
    on<UpdateUser>((event, emit) {
      emit(Loading());
      eventsRepository.updateUser(event.userFA);
      emit(const AfterDatabaseUpdate(dbMessage: "Updated Successfully"));
    });
  }
}
