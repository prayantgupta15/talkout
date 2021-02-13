import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkout/utils/components/CommentBox.dart';
import 'package:talkout/utils/data.dart';

class ReplyThreadScreen extends StatefulWidget {
  int commmentIndex;
  ReplyThreadScreen({@required this.commmentIndex});
  @override
  _ReplyThreadScreenState createState() => _ReplyThreadScreenState();
}

class _ReplyThreadScreenState extends State<ReplyThreadScreen> {
  int maxLines = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Thread",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, i) => Divider(),
                  shrinkWrap: true,
                  itemCount: comments['data'][widget.commmentIndex]['replies'].length,
                  itemBuilder: (context, replyIndex) {
                    return replyIndex == 0
                        ? Column(
                            children: [
                              SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: CommentBox(child: Text(comments['data'][widget.commmentIndex]['comment'])),
                              ),
                              Divider(thickness: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                child: CommentBox(
                                    child: Text(comments['data'][widget.commmentIndex]['replies'][replyIndex])),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child:
                                CommentBox(child: Text(comments['data'][widget.commmentIndex]['replies'][replyIndex])),
                          );
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: TextField(
                      maxLines: maxLines,
                      onChanged: (str) {
                        int m = maxLines;
                        maxLines = ((str.length) / 35).toInt() + 1;
                        m != maxLines ? setState(() {}) : null;
                      },
                      style: TextStyle(fontSize: 15),
                      decoration: InputDecoration(
                        hintText: 'Write a Reply..',
                        hintStyle: TextStyle(fontSize: 15),
                        focusColor: Colors.black12,
                        fillColor: Colors.black12,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // extendBodyBehindAppBar: true,
        // bottomNavigationBar:
      ),
    );
  }
}
