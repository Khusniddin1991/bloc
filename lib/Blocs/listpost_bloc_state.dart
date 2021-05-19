

import 'package:blocapp/Model/Post.dart';
import 'package:blocapp/Model/UserContacts.dart';
import 'package:equatable/equatable.dart';

abstract class ListPostsState extends  Equatable{



  List<Object> get  props=>[];

}

class ListPostInit extends ListPostsState{

}
class ListPostLoading extends ListPostsState{}
class ListPostLoaded extends ListPostsState{
 final List<User> posts;
 final bool delated;

 ListPostLoaded({this.posts,this.delated});


}
class ListPostError extends ListPostsState{
  final error;
  ListPostError({this.error});

}