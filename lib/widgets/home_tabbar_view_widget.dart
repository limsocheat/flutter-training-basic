import 'package:angkordev/config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class HomeTabBarViewWidget extends StatelessWidget {
  final String title;
  final int id;

  HomeTabBarViewWidget(this.title, {this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
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
          ),
          Expanded(
            child: Container(
              color: Colors.black12,
              child: ListView(
                children: Config.articles.map((item) {
                  return HomeCategoryListTileWidget(
                    title: item.title,
                    imageUrl: item.imageUrl,
                    date: item.date,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCategoryListTileWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;

  const HomeCategoryListTileWidget({
    Key key,
    this.imageUrl,
    this.title,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 100,
            width: 120,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red,),
            ),
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
                      title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          date,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
