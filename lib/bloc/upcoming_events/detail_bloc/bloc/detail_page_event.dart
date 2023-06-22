part of 'detail_page_bloc.dart';

abstract class DetailPageEvent extends Equatable {
  const DetailPageEvent();

  @override
  List<Object> get props => [];
}

class OnPageLoad extends DetailPageEvent {
  @override
  List<Object> get props => [];
}

class UpdateUser extends DetailPageEvent {
  final UserFA userFA;
  const UpdateUser({required this.userFA});
  @override
  List<Object> get props => [userFA];
}
