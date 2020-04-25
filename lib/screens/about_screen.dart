import 'package:angkordev/controllers/post_controller.dart';
import 'package:angkordev/widgets/global_drawer_widget.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<PostModel> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostController.fetchPosts().then((postResponse) {
      setState(() {
        posts = postResponse;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Screen'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('About Screen'),
              IconButton(
                icon: Icon(Icons.file_download),
                onPressed: () {
                  PostController.fetchPosts();
                },
              )
            ],
          ),
        ),
      ),
      drawer: GlobalDrawerWidget(),
    );
  }
}
