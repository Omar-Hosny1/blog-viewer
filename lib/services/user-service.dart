import 'dart:io';

import 'package:blog_viewer/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<User> fetchUserData(String id) async {
    try {
      final getUserEP = "https://jsonplaceholder.typicode.com/users/$id";
      final parsedUrl = Uri.parse(getUserEP);
      final response = await http.get(parsedUrl);
      if (![200, 201].contains(response.statusCode)) {
        throw const HttpException("Something Went Wrong");
      }
      return userFromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }
}
