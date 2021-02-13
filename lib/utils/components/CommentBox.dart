import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:talkout/utils/components/colorsComponents.dart';

class CommentBox extends StatefulWidget {
  Widget child;
  CommentBox({@required this.child});
  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  bool liked = Random().nextBool();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
            child: Icon(Icons.person, color: Colors.white),
            backgroundColor: avatarColors[Random().nextInt(avatarColors.length)]),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      // width: MediaQuery.of(context).size.width * 0.9,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(12),
                      child: widget.child),
                  GestureDetector(
                    onTap: () {
                      liked = !liked;
                      setState(() {});
                    },
                    child: Icon(
                      liked ? (Mdi.heart) : (Mdi.heartOutline),
                      color: liked ? Colors.red : Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("       ${Random().nextInt(23) + 1}h"),
                  Icon(Icons.reply, size: 12),
                ],
              ),
              // SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
