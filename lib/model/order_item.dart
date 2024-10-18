class OrderItem {
  final String name;
  final double price;
  int quantity;

  OrderItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}
