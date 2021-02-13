import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkout/Screens/CommentsScreen.dart';

class ImageComponent extends StatefulWidget {
  @override
  _ImageComponentState createState() => _ImageComponentState();
}

class _ImageComponentState extends State<ImageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset("assets/img.jpg", scale: 16 / 9),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Let Out A Thing of the past that bothers you",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
