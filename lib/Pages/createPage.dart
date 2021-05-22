import 'package:blocapp/Blocs/create_bloc_state.dart';
import 'package:blocapp/Blocs/create_bloc_widget.dart';
import 'package:blocapp/Views/createPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePage extends StatelessWidget {

  TextEditingController titleController = new TextEditingController();
  TextEditingController bodyController = new TextEditingController();

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Post"),
        ),
        body: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (BuildContext context, CreatePostState state) {
            if(state is CreatePostLoading){
              return viewOfCreate(true,context,titleController,bodyController);
            }
            if(state is CreatePostLoaded){
              _finish(context);
            }
            if(state is CreatePostError){

            }
            return viewOfCreate(false,context,titleController,bodyController);
          },
        ),
      ),
    );
  }
}