import 'package:flutter/material.dart';
import 'package:spendy/controller/login_service.dart';
import 'package:spendy/controller/spend.dart';

class DataBox extends StatefulWidget {
  final String eventName;
  final String description;
  final String expectedAmount;
  final String? spentAmount;
  final String id;
  final Function() function;

  const DataBox({
    Key? key,
    required this.eventName,
    required this.description,
    required this.expectedAmount,
    required this.function,
    this.spentAmount,
    required this.id,
  }) : super(key: key);

  @override
  _DataBoxState createState() => _DataBoxState();
}

class _DataBoxState extends State<DataBox> {
  final amountController =
      TextEditingController(); // Create a controller for each DataBox

  @override
  void dispose() {
    amountController
        .dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.spentAmount != null) {
      amountController.text =
          widget.spentAmount!; // Set text if spentAmount is provided
    }

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 177, 207, 178),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.eventName,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 10),
            Text("Expected amount : ${widget.expectedAmount}"),
            const SizedBox(height: 10),
            if (widget.spentAmount != null) // Conditionally render spent amount
              Text(
                  'Spent amount: ${widget.spentAmount}'), // Show spent amount if available
            if (widget.spentAmount == null) // Conditionally render text field
              Row(
                children: [
                  Text('Spent amount'),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: amountController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Amount",
                        fillColor: const Color.fromARGB(255, 233, 247, 233),
                        filled: true,
                        contentPadding: const EdgeInsets.all(10),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      sendTextFieldValue(
                          context: context,
                          value: amountController.text,
                          evId: widget.id,
                          usId: userId!);

                      amountController.clear();
                    },
                    child: Icon(Icons.save),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 3, 32, 4),
                    ),
                  ),
                  TextButton(onPressed: widget.function, child: Text('View'))
                ],
              ),
          ],
        ),
      ),
    );
  }
}
