import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

Future<void> sendTextFieldValue(
    {required String value,
    required String evId,
    required String usId,
    required BuildContext context}) async {
  // Define the URL for the POST request
  String url = 'https://spendy-u3oz.onrender.com/flutter/spent';

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse(url),
      body: {
        'userId': usId,
        'eventId': evId,
        'spend': value
      }, // Pass the text field value as the request body
    );

    // Check the response status code
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Dialog Title'),
            content: Text('This is a simple dialog.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
      print('Value sent successfully');

      // Request successful
    } else {
      // Request failed
      print('Failed to send value. Status code: ${response.statusCode}');
    }
  } catch (error) {
    // Error occurred during the request
    print('Error: $error');
  }
}
