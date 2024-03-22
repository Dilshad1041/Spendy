import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spendy/controller/login_service.dart';

import 'package:spendy/model/event_model.dart';

Future<List<EventModel>> fetchEvents() async {
  String url = 'https://spendy-u3oz.onrender.com/flutter/home?id=$userId';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Successful request
      final List<dynamic> responseData = json.decode(response.body);
      return responseData.map((json) => EventModel.fromJson(json)).toList();
    } else {
      // Request failed
      print(userId);
      print('Request failed with status: ${response.statusCode}');
      return []; // Return empty list or throw an error
    }
  } catch (error) {
    // Error occurred during the request
    print('Error: $error');
    return []; // Return empty list or throw an error
  }
}
