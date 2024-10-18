import 'package:flutter/material.dart';
import 'package:p1_flutter_2/model/order_item.dart';
import 'package:p1_flutter_2/model/order_model.dart';
import 'package:provider/provider.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String itemName;
  final String itemDescription;
  final double itemPrice;

  ItemDetailsScreen({
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              itemDescription,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text(
              'Preço: R\$ ${itemPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Adiciona o item ao pedido
                Provider.of<OrderModel>(context, listen: false).addItem(OrderItem(
                  name: itemName,
                  price: itemPrice,
                ));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('$itemName adicionado ao pedido!'),
                ));
                Navigator.pop(context);
              },
              child: Text('Adicionar ao Pedido'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
