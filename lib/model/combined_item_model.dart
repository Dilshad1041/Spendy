class CombinedItem {
  final String? name;
  final String? quantity;
  bool isSelected; // Add isSelected property

  CombinedItem({
    this.name,
    this.quantity,
    this.isSelected = false, // Set default value to false
  });

  factory CombinedItem.fromJson(Map<String, dynamic> json) {
    return CombinedItem(
      name: json['name'],
      quantity: json['quantity'],
    );
  }
}
