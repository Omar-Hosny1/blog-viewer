import 'dart:async';
import 'dart:io';
import 'package:blog_viewer/models/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogService {
  static Future<List<Blog>> fetchBlogs() async {
    try {
      const getBlogsEP = "https://jsonplaceholder.typicode.com/posts";
      final parsedUrl = Uri.parse(getBlogsEP);
      final response = await http.get(parsedUrl);
      if (![200, 201].contains(response.statusCode)) {
        throw const HttpException("Something Went Wrong");
      }
      return blogFromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<Blog> getBlog(String id) async {
    try {
      final getBlogsEP = "https://jsonplaceholder.typicode.com/posts/$id";
      final parsedUrl = Uri.parse(getBlogsEP);
      final response = await http.get(parsedUrl);
      if (![200, 201].contains(response.statusCode)) {
        throw const HttpException("Something Went Wrong");
      }
      return Blog.fromJson(json.decode(response.body));
    } catch (e) {
      throw const HttpException('Check Your Network, And Try Again Later');
    }
  }

  static Future<void> addBlog({required Blog blog}) async {
    try {
      const addBlogEP = "https://jsonplaceholder.typicode.com/posts";
      final parsedUrl = Uri.parse(addBlogEP);
      final response = await http.post(
        parsedUrl,
        body: json.encode(
          {
            'title': blog.title,
            'body': blog.body,
            'id': blog.id,
            'userId': blog.userId
          },
        ),
      );
      if (![200, 201].contains(response.statusCode)) {
        throw const HttpException("Something Went Wrong");
      }
    } catch (e) {
      throw const HttpException('Check Your Network, And Try Again Later');
    }
  }
}
