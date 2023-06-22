part of 'designer_bloc.dart';

abstract class DesignerState extends Equatable {
  const DesignerState();

  @override
  List<Object> get props => [];
}

class DesignerInitial extends DesignerState {}

class DesignerLoading extends DesignerState {}

class DesignerDatabaseSucceeded extends DesignerState {
  final List<DesignerModel> listOfDesigner;
  const DesignerDatabaseSucceeded(this.listOfDesigner);
  @override
  List<Object> get props => [listOfDesigner];
}

//GalleryCallDetailPage
class DesignerCallDetailPage extends DesignerState {
  const DesignerCallDetailPage();
  @override
  List<Object> get props => [];
}

class DesignerDatabaseError extends DesignerState {
  final String errorMessage;
  const DesignerDatabaseError(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
