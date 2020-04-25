import 'package:angkordev/controllers/post_controller.dart';
import 'package:angkordev/screens/single_screen.dart';
import 'package:angkordev/widgets/favourite_icon_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post_model.dart';

class HomeTabBarViewWidget extends StatefulWidget {
  final String title;
  final int id;

  HomeTabBarViewWidget(this.title, {this.id});

  @override
  _HomeTabBarViewWidgetState createState() => _HomeTabBarViewWidgetState();
}

class _HomeTabBarViewWidgetState extends State<HomeTabBarViewWidget> {
  // declare state to be used in build function
//  List<PostModel> posts = [];
//
//  @override
//  void initState() {
//    super.initState();
//    // api call to get posts data
//    PostController.fetchPosts().then((postResponse) {
//      // set new state upon getting response data
//      setState(() {
//        posts = postResponse;
//      });
//    });
//  }

  final pageWiseController = PagewiseLoadController(
    pageSize: 10,
    pageFuture: (index) =>
        PostController.fetchPosts(perPage: 10, page: index + 1),
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        pageWiseController.reset();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return FeaturedArticleCarouselWidget();
                },
                childCount: 1,
              ),
            ),
            ArticlePageWiseWidget(
              pageWiseController: pageWiseController,
            ),
          ],
        ),
      ),
    );
  }
}

class ArticlePageWiseWidget extends StatelessWidget {
  const ArticlePageWiseWidget({
    Key key,
    @required this.pageWiseController,
  }) : super(key: key);

  final PagewiseLoadController<PostModel> pageWiseController;

  @override
  Widget build(BuildContext context) {
    return PagewiseSliverList(
      itemBuilder: (context, PostModel post, _) {
        return HomeCategoryListTileWidget(
          title: post.title,
          imageUrl: post.image,
          date: post.datetime.toString(),
          post: post,
        );
      },
      pageLoadController: pageWiseController,
    );
  }
}

class FeaturedArticleCarouselWidget extends StatelessWidget {
  const FeaturedArticleCarouselWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Carousel(
        images: [
          NetworkImage(
              'https://scstylecaster.files.wordpress.com/2019/12/black-pink.jpg'),
          NetworkImage(
              'https://scstylecaster.files.wordpress.com/2019/08/blackpink.jpg'),
          NetworkImage(
              'https://1409791524.rsc.cdn77.org/data/images/full/538679/blackpink-leave-yg.png'),
        ],
        autoplay: false,
        overlayShadowColors: Colors.red,
        dotBgColor: Colors.red.withOpacity(0.2),
      ),
    );
  }
}

class HomeCategoryListTileWidget extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String date;
  final PostModel post;

  const HomeCategoryListTileWidget({
    Key key,
    this.imageUrl,
    this.title,
    this.date,
    this.post,
  }) : super(key: key);

  @override
  _HomeCategoryListTileWidgetState createState() =>
      _HomeCategoryListTileWidgetState();
}

class _HomeCategoryListTileWidgetState
    extends State<HomeCategoryListTileWidget> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isNewFavourite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var results = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleScreen(post: widget.post)));
        if (results != null) {
          setState(() {
            isNewFavourite = results;
          });
        } else {
          setState(() {
            isNewFavourite = null;
          });
        }
      },
      child: Card(
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 120,
              child: widget.imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    )
                  : Image.asset('assets/images/logo.jpg'),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 8,
                  right: 10,
                  bottom: 2,
                ),
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        widget.title,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.date,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ),
                        widget.post.authorName != null
                            ? Text(widget.post.authorName)
                            : Container(),
                        FavouriteIconWidget(
                          postId: widget.post.id,
                          overrideValue: isNewFavourite,
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            Share.share(
                              widget.post.link,
                              subject: widget.title,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
