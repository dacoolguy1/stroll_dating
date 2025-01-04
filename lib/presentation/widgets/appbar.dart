import 'package:flutter/material.dart';

AppBar CustomAppBar(String titletext, BuildContext context) {
  return AppBar(
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(titletext,
        style: TextStyle(
            fontSize: 16, fontFamily: 'inter', fontWeight: FontWeight.w500)),
  );
}
