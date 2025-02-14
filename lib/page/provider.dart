import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider extends ChangeNotifier {
  bool loading = false;
  List<dynamic> posts = [];
  String error = '';

  Future<void> fetchPosts() async {
    loading = true;
    error = '';
    notifyListeners();

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        posts = json.decode(response.body);
      } else {
        error = 'Failed to load posts';
      }
    } catch (e) {
      error = 'Error: $e';
    }

    loading = false;
    notifyListeners();
  }
}
