import 'package:intl/intl.dart';

class PostModel {
  final int id;
  final String title;
  final String body;
  final String datetime;
  final String link;
  final String authorName;
  final String featuredImageCaption;
  final String image;

  PostModel({
    this.id,
    this.title,
    this.body,
    this.datetime,
    this.link,
    this.authorName,
    this.featuredImageCaption,
    this.image,
  });

  // Convert Json to Model
  factory PostModel.fromJson(Map<String, dynamic> item) {
    return PostModel(
      id: int.parse(item['id'].toString()),
      title: item['title']['rendered'].toString(),
      body: item['content']['rendered'].toString(),
      datetime: DateFormat('d MMM y').format(DateTime.parse(item['date'])),
      link: item['link'],
      authorName: _getAuthorName(item),
      image: _getImageUrl(item),
      featuredImageCaption: _getFeatureImageCaption(item),
    );
  }

  static String _getAuthorName(json) {
    String author;
    if (json.containsKey('_embedded')) {
      if (json['_embedded'].containsKey('author')) {
        var firstAuthor = json['_embedded']['author'][0];
        author = firstAuthor['name'];
      }
    }

    return author;
  }

  static String _getFeatureImageCaption(json) {
    String caption = "No Caption";
    if (json.containsKey('_embedded')) {
      if (json['_embedded'].containsKey('wp:featuredmedia')) {
        var firstImage = json['_embedded']['wp:featuredmedia'][0];
        if (firstImage != '') {
          if (firstImage['caption']['rendered'] != '') {
            caption = firstImage['caption']['rendered'];
          } else {
            caption = firstImage['title']['rendered'];
          }
        }
      }
    }
    return caption;
  }

  static String _getImageUrl(json) {
    String url;
    if (json.containsKey('_embedded')) {
      if (json['_embedded'].containsKey('wp:featuredmedia')) {
        var firstImage = json['_embedded']['wp:featuredmedia'][0];
        if (firstImage.containsKey('source_url')) {
          url = firstImage['source_url'];
        }
      }
    }
    return url;
  }
}
