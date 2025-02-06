import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class LoginViewModel extends ChangeNotifier {
  bool isLoading = false;
  bool isDataLoaded = false; // Track if data has been loaded

  String? dummyUsername;
  String? dummyPassword;

  // Load dummy data from the JSON file
  Future<void> loadDummyData() async {
    if (!isDataLoaded) {
      final String response =
          await rootBundle.loadString('assets/json/temp_login.json');
      final Map<String, dynamic> data = json.decode(response);
      dummyUsername = data['username'];
      dummyPassword = data['password'];
      isDataLoaded = true; // Mark data as loaded
      notifyListeners();
    }
  }

  // Login function
  Future<bool> loginDummyJson(String username, String password) async {
    isLoading = true;
    notifyListeners();

    // Load dummy data if not already loaded
    await loadDummyData();

    await Future.delayed(const Duration(seconds: 2)); // Simulate loading

    isLoading = false;
    notifyListeners();

    // Check credentials
    if (username == dummyUsername && password == dummyPassword) {
      return true; // Successful login
    } else {
      return false; // Failed login
    }
  }
}
