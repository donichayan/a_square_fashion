part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  // GalleryEvent();

  @override
  List<Object> get props => [];
}

class GalleryDatabaseFetched extends GalleryEvent {
  // final Stream<QuerySnapshot> eventList;
  GalleryDatabaseFetched();

  @override
  List<Object> get props => [];
}
