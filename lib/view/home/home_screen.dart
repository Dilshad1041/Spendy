import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:spendy/view/event/even_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Midhun"),
        actions: [
          Image.asset(
            "assets/calculator.png",
            height: 25,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'RS.${2000}',
            style: TextStyle(fontSize: 18),
          ),
          IconButton(
            onPressed: () {},
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
      body: Container(),
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
