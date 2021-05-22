import 'package:blocapp/Blocs/updateCreate.dart';
import 'package:blocapp/Model/UserContacts.dart';
import 'package:blocapp/Services/Network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UpdatePostCubit extends Cubit<UpdatePostState>  {
  UpdatePostCubit() : super(UpdatePostInit());


  void apiPostUpdate(User post) async{
    post.id = "1";
    print(post.toJson());
    emit(UpdatePostLoading());
    final response = await Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    print(response);
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Couldn't update post"));
    }
  }
}