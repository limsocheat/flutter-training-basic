import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController {
  //

  static void add(int postId) async {
    // Declare Empty List
    List<int> lists = [];
    // Init SharePreference
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // get favourite ids as lists
    lists = await getFavouritePostIds().then((result) {
      return result;
    });
    if (lists.indexOf(postId) >= 0) {
      print('existed');
    } else {
      // add new id to list of Post Ids
      lists.add(postId);
    }
    //set new favourites list to SharePreference
    await prefs.setString('favourites', json.encode(lists));
  }

  static void remove(int postId) async {
    // Declare Empty List
    List<int> lists = [];
    // Init SharePreference
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // get favourite ids as lists
    lists = await getFavouritePostIds().then((result) {
      return result;
    });

    // add new id to list of Post Ids
    lists.remove(postId);
    //set new favourites list to SharePreference
    await prefs.setString('favourites', json.encode(lists));
  }

  static Future<bool> isFavourite(int postId) async {
    bool isFavourite = false;
    List<int> lists = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lists = await getFavouritePostIds().then((result) {
      return result;
    });

    if (lists.indexOf(postId) >= 0) {
      isFavourite = true;
    }

    return isFavourite;
  }

  static Future<List<int>> getFavouritePostIds() async {
    // Declare Empty List
    List<int> lists = [];
    // Init SharePreference
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Get SharePreference name: favourites
    var favourites = (prefs.getString('favourites') ?? '');
    //check if SharePreference favourite not empty
    if (favourites != '') {
      // convert favourite String to json
      var favouriteList = json.decode(favourites) as List;
      // convert json to List of Int (ids)
      lists = favouriteList.map((id) => int.parse(id.toString())).toList();
    }
    // Return value of method
    return lists;
  }

  static Future<bool> reset() async {
    List<int> lists = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('favourites', json.encode(lists));
    return true;
  }
}
