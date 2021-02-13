import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:talkout/Screens/CommentsScreen.dart';
import 'package:talkout/utils/components/CommentBox.dart';
import 'package:talkout/utils/components/ImageComponent.dart';
import 'package:talkout/utils/data.dart';

class TopicComponent extends StatefulWidget {
  @override
  _TopicComponentState createState() => _TopicComponentState();
}

class _TopicComponentState extends State<TopicComponent> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
              onDoubleTap: () {
                bool b = liked;
                liked = true;
                b != liked
                    ? setState(() {
                        comments['likes']++;
                      })
                    : null;
              },
              child: ImageComponent()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: liked ? Icon(Mdi.heart) : Icon(Mdi.heartOutline),
                    color: liked ? Colors.red : Colors.black,
                    onPressed: () {
                      liked = !liked;
                      liked ? comments['likes']++ : comments['likes']--;

                      setState(() {});
                    },
                  ),
                  Text(comments['likes'].toString())
                ],
              ),
              SizedBox(width: 10),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.chat_outlined),
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => CommentsScreen()));
                    },
                  ),
                  Text(comments['data'].length.toString())
                ],
              )
            ],
          ),
          CommentBox(
            child: comments['data'][0]['comment'].length > 80
                ? RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: comments['data'][0]['comment'].toString().substring(0, 80) + '... ',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: 'Continue Reading',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                                return CommentsScreen();
                              }));
                            })
                    ]),
                  )
                : Text(comments['data'][0]['comment']),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) => CommentsScreen()));
            },
            child: Text("View all ${comments['data'].length} comments",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
