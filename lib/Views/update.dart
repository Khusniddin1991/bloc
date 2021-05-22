
import 'package:blocapp/Blocs/update.dart';
import 'package:blocapp/Model/UserContacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget viewOfUpdate(bool isLoading, BuildContext context,User post,TextEditingController titleController, TextEditingController bodyController){
  return Container(
    padding: EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  hintText: "Body",
                  hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                BlocProvider.of<UpdatePostCubit>(context).apiPostUpdate(post);
              },
              color: Colors.blue,
              child: Text(
                "Update a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),

        isLoading ? Center(
          child: CircularProgressIndicator(),
        ): SizedBox.shrink(),
      ],
    ),
  );
}