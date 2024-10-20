import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stadium/provider/base_provider.dart';

class AuthenProvider extends BaseProvider {
  bool authenticated = false;

  initializeAuthProvider() async {
    setLoading(true);
    setError(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    authenticated = (token != null) ? true : false;

    if (authenticated) {
      api.refreshToken();
    }
    print("Bearer Token is : $token");
    print("Auth Status is : $authenticated");

    setLoading(false);
  }

  Future<List> login(Map body) async {
    setLoading(true);
    setError(false);
    Response response = await api.post("login", body);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (response.statusCode == 200) {
      prefs.setString("token", json.decode(response.body)['access_token']);
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      prefs.remove("token");
      return [false, json.decode(response.body)['message']];
    }
  }

  Future<List> register(Map body) async {
    setLoading(true);
    setError(false);
    Response response = await api.post("register", body);
    if (kDebugMode) {
      print("status code: ${response.statusCode}");
      print("Response: ${response.body}");
    }
    if (response.statusCode == 201) {
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      return [false, json.decode(response.body)['message']];
    }
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setLoading(true);
    setError(false);
    Response response = await api.post("logout", {});
    if (response.statusCode == 200) {
      prefs.remove("token");
      authenticated = false;
      setLoading(false);
      setError(false);
      return true;
    } else {
      setLoading(false);
      setError(true);
      return false;
    }
  }
}