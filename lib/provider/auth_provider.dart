import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stadium/models/user_model.dart';
import 'package:stadium/provider/base_provider.dart';

class AuthenProvider extends BaseProvider {
  bool authenticated = false;
  UserModel? userModel;
  bool? isFirstTime;

  isFirstTimee() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool("isFirstTime") ?? true;
    if (isFirstTime!) {
      prefs.setBool("isFirstTime", false);
    }
    if (kDebugMode) {
      print("isFirstTime: $isFirstTime");
    }
  }

  initializeAuthProvider() async {
    setLoading(true);
    setError(false);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    authenticated = (token != null) ? true : false;

    // if (authenticated) {
    //   api.refreshToken();
    // }
    if (kDebugMode) {
      print("Bearer Token is : $token");
      print("Auth Status is : $authenticated");
    }

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

  Future<List> sendOtp(String phone, String purpose) async {
    setLoading(true);
    setError(false);
    final body = {'phone_number': phone, 'purpose': purpose};
    Response response = await api.post("otp/send", body);
    if (kDebugMode) {
      print("Send OTP Status Code: ${response.statusCode}");
      print("Send OTP Response: ${response.body}");
    }
    if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      return [
        false,
        json.decode(response.body)['message'] ?? 'Failed to send OTP'
      ];
    }
  }

  Future<List> verifyOtp(String phone, String otpCode) async {
    setLoading(true);
    setError(false);
    final body = {'phone_number': phone, 'otp_code': otpCode};
    Response response = await api.post("otp/verify", body);
    if (kDebugMode) {
      print("Verify OTP Status Code: ${response.statusCode}");
      print("Verify OTP Response: ${response.body}");
    }
    if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      return [
        false,
        json.decode(response.body)['message'] ?? 'Failed to verify OTP'
      ];
    }
  }

  Future<List> registerUser(
      String phone, String password, Map<String, dynamic> userDetails) async {
    setLoading(true);
    setError(false);
    final body = {
      'phone_number': phone,
      'password': password,
      'type': 'user', // Assuming 'user' is the type for registration
      ...userDetails,
    };
    Response response = await api.post("register", body);
    if (kDebugMode) {
      print("Register User Status Code: ${response.statusCode}");
      print("Register User Response: ${response.body}");
    }
    if (response.statusCode == 201 || response.statusCode == 200) {
      // Assuming 200 is also a success for registration
      setLoading(false);
      setError(false);
      // Potentially save token here if returned by the new API
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("token", json.decode(response.body)['access_token']);
      // authenticated = true;
      return [
        true,
        json.decode(response.body)['message'] ?? 'Registration successful'
      ];
    } else {
      setLoading(false);
      setError(true);
      return [
        false,
        json.decode(response.body)['message'] ?? 'Registration failed'
      ];
    }
  }

  Future<List> resetPassword(String phone, String newPassword) async {
    setLoading(true);
    setError(false);
    final body = {'phone': phone, 'new_password': newPassword};
    Response response = await api.post("password/reset", body);
    if (kDebugMode) {
      print("Reset Password Status Code: ${response.statusCode}");
      print("Reset Password Response: ${response.body}");
    }
    if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
      return [true, json.decode(response.body)['message']];
    } else {
      setLoading(false);
      setError(true);
      return [
        false,
        json.decode(response.body)['message'] ?? 'Failed to reset password'
      ];
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

  Future getUser() async {
    setLoading(true);
    setError(false);
    var response = await api.get("profile");
    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      setLoading(false);
      setError(false);
      return userModel;
    } else {
      setLoading(false);
      setError(true);
      return jsonDecode(response.body);
    }
  }

  Future<List> updateProfile(UserModel body) async {
    setLoading(true);
    if (kDebugMode) {
      print(body);
    }
    var response = await api.put("profile/update", body);
    if (kDebugMode) {
      print("Response: ${response.body}");
      print("Status Code: ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      setLoading(false);
      setError(false);
      return [true, jsonDecode(response.body)];
    } else {
      setError(true);
      setLoading(false);
      return [false, jsonDecode(response.body)];
    }
  }

  updateUserProfilePhoto(File file) {
    setLoading(true);
    api.upload(file, "upload/user").then((value) {
      if (kDebugMode) {
        print("Response: ${value.body}");
        print("Status Code: ${value.statusCode}");
      }

      if (value.statusCode == 200) {
        setLoading(false);
        setError(false);
        UserModel? updateUserModelwithphoto = userModel;
        updateUserModelwithphoto!.avatar = jsonDecode(value.body)['image_name'];
        // updateProfile(updateUserModelwithphoto);
      } else {
        setError(true);
        setLoading(false);
      }
      // return jsonDecode(value.body);
    });
  }

  updateUserProfilecover(File file) {
    setLoading(true);
    api.upload(file, "upload/user/cover").then((value) {
      if (kDebugMode) {
        print("Response: ${value.body}");
        print("Status Code: ${value.statusCode}");
      }

      if (value.statusCode == 200) {
        setLoading(false);
        setError(false);
        UserModel? updateUserModelwithphoto = userModel;
        updateUserModelwithphoto!.cover = jsonDecode(value.body)['image_name'];
        // updateProfile(updateUserModelwithphoto);
      } else {
        setError(true);
        setLoading(false);
      }
      // return jsonDecode(value.body);
    });
  }
}
