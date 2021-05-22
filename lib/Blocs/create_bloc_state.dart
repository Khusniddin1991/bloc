import 'package:blocapp/Model/UserContacts.dart';
import 'package:equatable/equatable.dart';

import 'listpost_bloc_state.dart';


abstract class CreatePostState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CreatePostInit extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostLoaded extends CreatePostState {
  final bool isCreated;

  CreatePostLoaded({this.isCreated});
}

class CreatePostError extends CreatePostState {
  final error;
  CreatePostError({this.error});
}