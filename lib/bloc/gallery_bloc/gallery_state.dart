part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GalleryDatabaseSucceeded extends GalleryState {
  final List<GalleryModel> listOfGallery;
  const GalleryDatabaseSucceeded(this.listOfGallery);
  @override
  List<Object> get props => [listOfGallery];
}

//GalleryCallDetailPage
class GalleryCallDetailPage extends GalleryState {
  const GalleryCallDetailPage();
  @override
  List<Object> get props => [];
}

class GalleryDatabaseError extends GalleryState {
  final String errorMessage;
  const GalleryDatabaseError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
