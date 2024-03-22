import 'package:flutter/material.dart';

class RowData {
  String name;
  String quantity;

  RowData({required this.name, required this.quantity});
}

class ScreenEvent extends StatefulWidget {
  const ScreenEvent({super.key});

  @override
  State<ScreenEvent> createState() => _ScreenEventState();
}

bool isFocused = false;
String selectedItem = '';

class _ScreenEventState extends State<ScreenEvent> {
  List<RowData> rowDataList = []; // List to store row data

  final String name = "";
  final String quantity = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Event"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Event Name",
              // Your decoration
            ),
            onChanged: (value) {
              setState(() {
                selectedItem = value;
              });
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Description",
              // Your decoration
            ),
            maxLines: 5,
          ),
          for (int i = 0; i < rowDataList.length; i++)
            buildRow(i), // Build rows for existing row data
          ElevatedButton(
            onPressed: () {
              setState(() {
                rowDataList.add(RowData(name: "", quantity: ""));
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 1, 26, 3),
            ),
            child: const Text(
              "+",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
                // Your decoration
              ),
              onChanged: (value) {
                setState(() {
                  rowDataList[index].name = value;
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Quantity",
                // Your decoration
              ),
              onChanged: (value) {
                setState(() {
                  rowDataList[index].quantity = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
