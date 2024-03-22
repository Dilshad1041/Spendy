import 'package:spendy/model/combined_item_model.dart';

class EventModel {
  final String id;
  final String eventName;
  final String eventDescription;
  final int expectedRate;
  final List<CombinedItem> combinedItems;

  EventModel({
    required this.id,
    required this.eventName,
    required this.eventDescription,
    required this.expectedRate,
    required this.combinedItems,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> combinedItemsJson = json['combinedItems'];
    List<CombinedItem> combinedItems =
        combinedItemsJson.map((item) => CombinedItem.fromJson(item)).toList();

    return EventModel(
      id: json['_id'],
      eventName: json['eventName'],
      eventDescription: json['eventDescription'],
      expectedRate: json['expectedRate'],
      combinedItems: combinedItems,
    );
  }
}
