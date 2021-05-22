import 'package:blocapp/Model/UserContacts.dart';
import 'package:blocapp/Services/Network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_bloc_state.dart';

class CreatePostCubit extends Cubit<CreatePostState>  {
  CreatePostCubit() : super(CreatePostInit());


  void apiPostCreate(User post) async{
    print(post.toJson());
    emit(CreatePostLoading());
    final response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print(response);
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Couldn't create post"));
    }
  }
}