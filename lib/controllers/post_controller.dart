import 'dart:convert';

import 'package:angkordev/config.dart';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostController {
  //

  // declare method for controller
  static Future<List<PostModel>> fetchPosts({
    int perPage = 10,
    int page = 1,
    List<int> includes,
  }) async {
    var url = Config.postsApiUrl + '?_embed&perPage=$perPage' + '&page=$page';

    if (includes != null && includes.length > 0) {
      includes.forEach((include) {
        url += '&include[]=$include';
      });
    }

    // declare response data from api
    var response = await http.get(url);
    // convert response body to list of object
    var responsePostsList = json.decode(response.body) as List;
    // declare temporary list to hold listModel from response body
    List<PostModel> tempPosts = [];
    // map response body list of object to List of PostModel
    responsePostsList.map((post) {
      return tempPosts.add(PostModel.fromJson(post));
    }).toList();

    // Return list of post model to parent widget
    return tempPosts;
  }
}
