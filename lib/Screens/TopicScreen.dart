import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:talkout/utils/components/ImageComponent.dart';
import 'package:talkout/utils/components/TopicComponent.dart';

class TopicScreen extends StatefulWidget {
  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          key: key,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                key.currentState.openDrawer();
              },
            ),
            title: Text("Talk It Out", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.info_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),
          drawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 32,
                    ),
                  ),
                  accountName: Text("Hello User", style: TextStyle(fontWeight: FontWeight.bold)),
                  accountEmail: Text(""),
                ),
              ],
            ),
          ),
          body: ListView.builder(
            shrinkWrap: true,
            // physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, i) => Card(
                child: Padding(
              padding: EdgeInsets.all(12),
              child: i == 0
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trending",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TopicComponent(),
                      ],
                    )
                  : TopicComponent(),
            )),
          )),
    );
  }
}
