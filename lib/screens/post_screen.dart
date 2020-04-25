import 'dart:convert';

import 'package:angkordev/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  //Declare Variable/State
  PostModel post = PostModel(
    id: 2,
    title: 'Hello',
  );

  // Trigger on screen started
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSinglePost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Model & API Example')),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.file_download),
                onPressed: () async {
                  fetchSinglePost();
                },
              ),
              Text("id: " + post.id.toString()),
              Text("title: " + post.title),
            ],
          ),
        ),
      ),
    );
  }

  // FUTURE: to request from local app to server
  Future fetchSinglePost() async {
    //Declare Request Url
    var url = "https://jsonplaceholder.typicode.com/posts/1";
    //Declare http response
    // Await: to wait http to finish before render another code block
    var response = await http.get(url);
    // Print response data to console
    var body = response.body;
    setState(() {
      post = PostModel.fromJson(json.decode(body));
    });
  }
}

// 1. declare state
// 2. call function to get data from api in initState
// 3. create function to call from api
// 4. setState json data get from api
