import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spendy/controller/home_service.dart';
import 'package:spendy/model/event_model.dart';
import 'package:spendy/view/budget/budget_screen.dart';
import 'package:spendy/view/combined/combined_screen.dart';
import 'package:spendy/view/event/even_screen.dart';
import 'package:spendy/view/home/data_box.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({
    Key? key,
    required this.name,
    required this.budget,
  }) : super(key: key);

  final String name;
  final int budget;

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<EventModel> events = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      List<EventModel> fetchedEvents = await fetchEvents();
      setState(() {
        events = fetchedEvents;
        isLoading = false; // Set loading state to false after fetching data
      });
    } catch (error) {
      // Handle error
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          Image.asset(
            "assets/calculator.png",
            height: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'RS.${widget.budget}', // Ensure widget.budget is correct
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
            onPressed: () {
              budgetShowMyDialog(context);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
        backgroundColor: Colors.transparent, // Make the app bar transparent
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter, // Alignment for top to bottom
              end: Alignment.bottomCenter, // Alignment for bottom to top
              colors: [
                Colors.green,
                Color.fromARGB(255, 100, 201, 182),
              ],
            ),
          ),
        ),
        toolbarHeight: 150,
        elevation: 5,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                final event = events[index];
                return DataBox(
                  eventName: event.eventName,
                  description: event.eventDescription,
                  expectedAmount: event.expectedRate.toString(),
                  //spentAmount: event.,
                  function: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CombinedItemsScreen(
                          combinedItems: event.combinedItems,
                        ),
                      ),
                    );
                  },
                  id: event.id,
                );
              },
              itemCount: events.length,
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ScreenEvent(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
