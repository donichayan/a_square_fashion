part of 'detail_page_bloc.dart';

abstract class DetailPageState extends Equatable {
  const DetailPageState();

  @override
  List<Object> get props => [];
}

class DetailPageInitial extends DetailPageState {}

class Loading extends DetailPageState {}

class AfterPageLoad extends DetailPageState {
  final UserFA userFA;
  const AfterPageLoad(this.userFA);
  @override
  List<Object> get props => [userFA];
}

class AfterDatabaseUpdate extends DetailPageState {
  final String dbMessage;
  const AfterDatabaseUpdate({required this.dbMessage});
  @override
  List<Object> get props => [dbMessage];
}

class ErrorState extends DetailPageState {
  final String errorMessage;
  const ErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}
