import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';
import '../services/dialog_service.dart';
import '../widgets/loading_indicator.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var user = UserModel(login: '', password: '').obs;

  Future<void> login(String login, String password) async {
    try {
      // Show loading indicator while authenticating
      LoadingIndicator.show();

      // Prepare the login data
      final loginData = {'login': login, 'password': password};
      final encodedData = json.encode(loginData);
      // Make the API call
      final response = await http.post(
        Uri.parse('http://158.160.14.209/api/v1/auth/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: encodedData,
      );

      // Check the response status
     if (response.statusCode == 200) {
        // Parse the response data
        final responseData = json.decode(response.body);

        // Check if the response data is not null
        if (responseData != null) {
          // Create a UserModel from the response data
          final loggedInUser = UserModel(
            login: responseData['login'] ?? '',
            password: responseData['password'] ?? '',
          );

          // Update the user details
          user.value = loggedInUser;
          isLoggedIn.value = true;

          // Navigate to the home screen
          NavigationService.toHome();
        } else {
          // Handle null response data
          // DialogService.showErrorDialog('Invalid response data');
        }
      } 
    } catch (e) {
      debugPrint('Error Occured  $e');
    } finally {
      // Hide loading indicator
      LoadingIndicator.hide();
    }
  }

  // Rest of the code...
}
