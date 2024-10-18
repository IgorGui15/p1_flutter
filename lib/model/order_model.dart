import 'package:flutter/material.dart';
import 'order_item.dart';

class OrderModel extends ChangeNotifier {
  List<OrderItem> _items = [];

  List<OrderItem> get items => _items;

  // Adicionar item ao pedido
  void addItem(OrderItem item) {
    var existingItem = _items.firstWhere(
      (orderItem) => orderItem.name == item.name,
      orElse: () => OrderItem(name: '', price: 0),
    );
    
    if (existingItem.name.isNotEmpty) {
      existingItem.quantity++;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  // Remover item do pedido
  void removeItem(OrderItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // Obter o preço total do pedido
  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Limpar o pedido
  void clearOrder() {
    _items.clear();
    notifyListeners();
  }
}
