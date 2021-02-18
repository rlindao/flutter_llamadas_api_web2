import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Post.dart';

export '../models/Post.dart';


class HomeProvider {

  static final HomeProvider _singleton = HomeProvider._internal();

  HomeProvider._internal();

  factory HomeProvider() => _singleton;

  final hostname = 'jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    final uri = Uri.http(hostname, '/posts');

    final response = await http.get(uri);

    List serverData = json.decode( response.body );

    Posts posts = Posts.fromList( serverData );

    return posts.posts;
  }

}