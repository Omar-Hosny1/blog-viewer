import 'dart:convert';

List<Blog> blogFromJson(String str) =>
    List<Blog>.from(json.decode(str).map((x) => Blog.fromJson(x)));

String blogToJson(List<Blog> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Blog {
  int userId;
  int id;
  String title;
  String body;

  Blog({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
