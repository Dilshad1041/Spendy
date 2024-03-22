import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:spendy/view/home/home_screen.dart';

String? userId;

Future<void> loginUser({
  required String email,
  required String password,
  required BuildContext context,
  required Function(bool) setLoading,
}) async {
  setLoading(true); // Set loading state to true

  String url = 'https://spendy-u3oz.onrender.com/flutter/login';
  Map<String, String> body = {
    'email': email,
    'password': password,
  };

  try {
    final response = await http.post(Uri.parse(url), body: body);
    print(response.body);
    final responseData = json.decode(response.body);
    print(responseData);

    print(responseData.runtimeType); // Check if it's a Map
    print(responseData['_id']);

    userId = responseData['_id'];

    if (responseData is Map<String, dynamic> &&
        responseData.containsKey('name')) {
      // Navigate to the next screen and pass the name
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenHome(
              name: responseData['name'], budget: responseData['budget']),
        ),
      );
    } else {
      print('Error: Invalid response data or missing name field');
      // Handle the error accordingly, e.g., show an error message
    }
  } catch (error) {
    print('Error: $error');
    // Handle error
  } finally {
    setLoading(false); // Set loading state back to false
  }
}
