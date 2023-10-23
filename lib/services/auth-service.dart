import 'dart:convert';
import 'dart:io';
import 'package:blog_viewer/models/user-data.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<UserData> login({
    required String email,
    required String password,
  }) async {
    try {
      const apiKey = 'AIzaSyBz9uuglu3Ni57p4vgTm0Qf6UTljgnpkiA';
      const loginEP =
          "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey";
      final parsedUrl = Uri.parse(loginEP);
      final response = await http.post(
        parsedUrl,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      if (![200, 201].contains(response.statusCode)) {
        throw HttpException(json.decode(response.body)['error']['message']);
      }
      final UserData userData = userDataFromJson(response.body);
      return userData;
    } catch (e) {
      rethrow;
    }
  }

  static Future<UserData> signup({
    required String email,
    required String password,
  }) async {
    try {
      const apiKey = 'AIzaSyBz9uuglu3Ni57p4vgTm0Qf6UTljgnpkiA';
      const loginEP =
          "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey";
      final parsedUrl = Uri.parse(loginEP);
      final response = await http.post(
        parsedUrl,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      if (![200, 201].contains(response.statusCode)) {
        throw HttpException(json.decode(response.body)['error']['message']);
      }
      final UserData userData = userDataFromJson(response.body);
      return userData;
    } catch (e) {
      rethrow;
    }
  }
}
