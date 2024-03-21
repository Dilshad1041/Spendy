import 'package:flutter/material.dart';
import 'package:spendy/core/event_list.dart';

class ScreenEvent extends StatefulWidget {
  const ScreenEvent({Key? key}) : super(key: key);

  @override
  State<ScreenEvent> createState() => _ScreenEventState();
}

bool isFocused = false;
String selectedItem = '';

class _ScreenEventState extends State<ScreenEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Event"),
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
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              return dropdownItems.where((String option) {
                return option
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String value) {
              setState(() {
                selectedItem = value;
              });
            },
            fieldViewBuilder: (BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
                controller: textEditingController,
                focusNode: focusNode,
                onChanged: (value) {
                  // Update the autocomplete options based on the entered text
                  setState(() {});
                },
                decoration: InputDecoration(
                  //labelText: 'Select an Option',
                  hintText: "Event Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fillColor: const Color.fromARGB(255, 233, 247, 233),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: isFocused
                          ? const Color.fromARGB(255, 0, 13, 1)
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                ),
              );
            },
            optionsViewBuilder: (BuildContext context,
                AutocompleteOnSelected<String> onSelected,
                Iterable<String> options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final option = options.elementAt(index);
                        return ListTile(
                          title: Text(option),
                          onTap: () {
                            onSelected(option);
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Description",
              fillColor: const Color.fromARGB(255, 233, 247, 233),
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: isFocused
                      ? const Color.fromARGB(255, 0, 13, 1)
                      : Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
            onTap: () {
              setState(() {
                isFocused =
                    true; // Update isFocused when TextFormField is tapped
              });
            },
            onEditingComplete: () {
              setState(() {
                isFocused =
                    false; // Update isFocused when TextFormField loses focus
              });
            },
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
