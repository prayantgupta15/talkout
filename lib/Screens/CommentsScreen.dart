import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talkout/Screens/ReplyThreadScreen.dart';
import 'package:talkout/utils/components/CommentBox.dart';
import 'package:talkout/utils/components/ImageComponent.dart';
import 'package:talkout/utils/data.dart';

class CommentsScreen extends StatefulWidget {
  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            ImageComponent(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text("Top", style: TextStyle(color: selected == 0 ? Colors.white : Colors.black)),
                  color: selected == 0 ? Colors.redAccent : Colors.white,
                  onPressed: () {
                    selected = 0;
                    setState(() {});
                  },
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text("New", style: TextStyle(color: selected == 1 ? Colors.white : Colors.black)),
                  color: selected == 1 ? Colors.redAccent : Colors.white,
                  onPressed: () {
                    selected = 1;
                    setState(() {});
                  },
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text("My", style: TextStyle(color: selected == 2 ? Colors.white : Colors.black)),
                  color: selected == 2 ? Colors.redAccent : Colors.white,
                  onPressed: () {
                    selected = 2;
                    setState(() {});
                  },
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text("Counselor", style: TextStyle(color: selected == 3 ? Colors.white : Colors.black)),
                  color: selected == 3 ? Colors.redAccent : Colors.white,
                  onPressed: () {
                    selected = 3;
                    setState(() {});
                  },
                ),
              ],
            ),
            Divider(),
            Expanded(
              child: ListView.separated(
                // physics: BouncingScrollPhysics(),
                separatorBuilder: (context, i) => Divider(),
                shrinkWrap: true,
                itemCount: comments['data'].length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CommentBox(
                            child: Text(
                          comments['data'][index]['comment'],
                          maxLines: 3,
                        )),
                      ),
                      comments['data'][index]['replies'].length > 0
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                                  return ReplyThreadScreen(commmentIndex: index);
                                }));
                              },
                              child: Text(
                                "View all ${comments['data'][index]['replies'].length} replies",
                                style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                              ),
                            )
                          : Container(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
