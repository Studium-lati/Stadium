import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/models/user_model.dart';

class Api {
  Future<Response> get(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(Uri.parse(BASE_URL + url), headers: {
      "Accept": 'application/json',
      "content-type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (kDebugMode) {
      print('GET $url');
      print('Response: ${response.body}');
      print("Status Code: ${response.statusCode}");
    }
    if (response.statusCode == 401) {
      bool isRefreshed = await refreshToken();
      if (isRefreshed) {
        return get(url);
      }
    }
    return response;
  }

  Future<Response> post(String url, Map body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.post(Uri.parse(BASE_URL + url),
        headers: {
          "Accept": 'application/json',
          "Authorization": "Bearer $token"
        },
        body: body);

    if (kDebugMode) {
      print("Body: ${jsonEncode(body)}");
      print('POST $url');
      print('Response: ${response.body}');
      print("Status Code: ${response.statusCode}");
    }
    if (response.statusCode == 401) {
      bool isRefreshed = await refreshToken();
      if (isRefreshed) {
        return post(url, body);
      }
    }
    return response;
  }

  Future<Response> put(String url, UserModel body) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.put(Uri.parse(BASE_URL + url),
        headers: {
          "Accept": 'application/json',
          "content-type": "application/json",
          "Authorization": "Bearer $token"
        },
        body:jsonEncode(body) );

    if (kDebugMode) {
      print('PUT $url');
      print('Response: ${response.body}');
      print("Status Code: ${response.statusCode}");
    }
    if (response.statusCode == 401) {
      bool isRefreshed = await refreshToken();
      if (isRefreshed) {
        return put(url, body);
      }
    }
    return response;
  }

  Future<Response> delete(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.delete(Uri.parse(BASE_URL + url), headers: {
      "Accept": 'application/json',
      "content-type": "application/json",
      "Authorization": "Bearer $token"
    });

    if (kDebugMode) {
      print('DELETE $url');
      print('Response: ${response.body}');
      print("Status Code: ${response.statusCode}");
    }
    if (response.statusCode == 401) {
      bool isRefreshed = await refreshToken();
      if (isRefreshed) {
        return delete(url);
      }
    }
    return response;
  }

  Future<bool> refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? oldToken = prefs.getString('token');

    final response = await http.post(
      Uri.parse('${BASE_URL}refresh'),
      headers: {
        "Accept": 'application/json',
        "content-type": "application/json",
        "Authorization": "Bearer $oldToken"
      },
    );

    if (kDebugMode) {
      print('POST auth/refresh');
      print('Response: ${response.body}');
      print("Status Code: ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      var decodedToken = json.decode(response.body)['access_token'];
      prefs.setString('token', decodedToken);
      return true;
    }
    if (kDebugMode) {
      print('Failed to refresh token');
      print('Response: ${response.body}');
    }
    return false;
  }

  Future<Response> upload(File file, String url) async {
    if (kDebugMode) {
      print('UPLOAD $BASE_URL$url');
      print('File: ${file.path}');
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    var request = http.MultipartRequest('POST', Uri.parse('$BASE_URL$url'));
    request.headers['Authorization'] = "Bearer $token";
    request.headers['Accept'] = 'application/json';
    request.headers['content-type'] = 'application/json';

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', file.path);
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    if (kDebugMode) {
      print('Response: ${response.statusCode}');
      print('Response: ${response.request}');
    }

    return http.Response.fromStream(response);
  }
}
