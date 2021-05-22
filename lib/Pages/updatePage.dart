import 'package:blocapp/Blocs/update.dart';
import 'package:blocapp/Blocs/updateCreate.dart';
import 'package:blocapp/Model/Post.dart';
import 'package:blocapp/Model/UserContacts.dart';
import 'package:blocapp/Views/update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePage extends StatelessWidget {
  User post;

  UpdatePage({this.post});

  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = post.fullname;
    bodyController.text = post.name;

    return BlocProvider(
      create: (context) => UpdatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update a Post"),
        ),
        body: BlocBuilder<UpdatePostCubit, UpdatePostState>(
          builder: (BuildContext context, UpdatePostState state) {
            if(state is UpdatePostLoading){
              String title = titleController.text.toString();
              String body = bodyController.text.toString();
              User post = User(fullname:title,name: body );
              return viewOfUpdate(true,context,post, titleController, bodyController);
            }
            if(state is UpdatePostLoaded){
              _finish(context);
            }
            if(state is UpdatePostError){

            }
            return viewOfUpdate(false,context,post, titleController, bodyController);
          },
        ),
      ),
    );
  }

}