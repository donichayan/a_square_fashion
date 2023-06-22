import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vie_fashion_week/data/models/gallery.dart';
import 'package:vie_fashion_week/data/repositories/gallery_repository.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRepository galleryRepository;
  GalleryBloc({required this.galleryRepository}) : super(GalleryInitial()) {
    on<GalleryEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GalleryDatabaseFetched>(_fetchGallery);
  }
  _fetchGallery(
      GalleryDatabaseFetched event, Emitter<GalleryState> emit) async {
    // Stream<QuerySnapshot> eventList =  eventsRepository.getStream();
    try {
      List<GalleryModel> galleryList = await galleryRepository.getEventList();
      //UserFA userEvents = await eventsRepository.getUserEventList();
      while (galleryList.isEmpty) {
        emit(GalleryLoading());
      }

      // ignore: avoid_print
      // print('Event List Length: >>>> : ' + userEvents.length.toString());

      //eventList.sort((a, b) => a.date.compareTo(b.date));
      emit(GalleryDatabaseSucceeded(galleryList));
    } on Exception catch (e) {
      emit(GalleryDatabaseError(e.toString()));
    }
  }
}
