import 'package:angkordev/models/post_model.dart';
import 'package:angkordev/widgets/favourite_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';

class SingleScreen extends StatefulWidget {
  final PostModel post;

  SingleScreen({this.post});

  @override
  _SingleScreenState createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context, FavouriteIconWidget.isFavourite);
          },
        ),
        title: Text(widget.post.title),
        actions: <Widget>[
          FavouriteIconWidget(
            postId: widget.post.id,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(widget.post.title + " " + widget.post.link);
            },
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.post.title,
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 22),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.post.datetime,
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    widget.post.authorName,
                    style: Theme.of(context).textTheme.subtitle.copyWith(
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ),
            Image(
              image: NetworkImage(widget.post.image),
            ),
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.black,
              child: Text(
                widget.post.featuredImageCaption,
                style: Theme.of(context)
                    .textTheme
                    .subtitle
                    .copyWith(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Html(
                data: widget.post.body,
                onImageTap: (src) {
                  print(src);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
