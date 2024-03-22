import 'package:flutter/material.dart';
import 'package:spendy/model/combined_item_model.dart';

class CombinedItemsScreen extends StatefulWidget {
  final List<CombinedItem>? combinedItems;

  CombinedItemsScreen({required this.combinedItems});

  @override
  State<CombinedItemsScreen> createState() => _CombinedItemsScreenState();
}

class _CombinedItemsScreenState extends State<CombinedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.combinedItems == null || widget.combinedItems!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
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
        body: Center(
          child: Text('No combined items available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Combined Items"),
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
      body: ListView.builder(
        itemCount: widget.combinedItems!.length,
        itemBuilder: (context, index) {
          final item = widget.combinedItems![index];
          return Card(
            child: ListTile(
              title: Text(item.name ?? 'Unknown'),
              subtitle: Text('Quantity: ${item.quantity ?? 'Unknown'}'),
              trailing: Checkbox(
                value: item.isSelected ?? false,
                onChanged: (value) {
                  // Update the isSelected property of the item
                  // and rebuild the UI
                  setState(() {
                    item.isSelected = value ?? false;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
