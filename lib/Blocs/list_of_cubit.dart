

import 'package:blocapp/Model/Post.dart';
import 'package:blocapp/Model/UserContacts.dart';
import 'package:blocapp/Pages/createPage.dart';
import 'package:blocapp/Services/Network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'listpost_bloc_state.dart';

class ListPostCubit extends Cubit<ListPostsState>{
  ListPostCubit() : super(ListPostInit());
  void apiPostList() async {
  emit(ListPostLoading());
    final response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
   if(response!=null){
     emit(ListPostLoaded(posts: Network.parsePostList(response)));
   }else{
     emit(ListPostError(error: "something is not right here"));
   }
  }


  void apiPostDelete(User post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    print(response);
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }
  void callCreatePage(BuildContext context) async {
    var results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreatePage()));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }


}