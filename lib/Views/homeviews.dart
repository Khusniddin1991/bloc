import 'package:blocapp/Model/Post.dart';
import 'package:blocapp/Model/UserContacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_of_list.dart';

Widget viewOfHome(List<User> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPost(items[index],ctx );
        },
      ),
      isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SizedBox.shrink(),
    ],
  );
}