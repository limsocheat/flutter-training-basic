import 'package:angkordev/controllers/favourite_controller.dart';
import 'package:angkordev/controllers/post_controller.dart';
import 'package:angkordev/models/post_model.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> favourites = [];
  List<PostModel> posts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () async {
              await FavouriteController.reset().then((result) {
                if (result == true) {
                  setState(() {
                    favourites = [];
                  });
                }
              });
            },
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: posts.map((post) {
            return Card(
              child: Text(post.title.toString()),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _getFavourites() async {
    await FavouriteController.getFavouritePostIds().then((result) {
      setState(() {
        favourites = result;
      });
      if (result.length > 0) {
        PostController.fetchPosts(includes: result).then((postResult) {
          setState(() {
            posts = postResult;
          });
        });
      }
    });
  }
}
