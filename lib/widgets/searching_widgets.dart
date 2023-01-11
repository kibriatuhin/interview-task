import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/AppColors.dart';
import '../screens/bottom_nav_pages/search.dart';
class Searching extends StatelessWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        //onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_)=>SearchScreens())),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          filled: true,
          fillColor: AppColors.white2,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none),
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
