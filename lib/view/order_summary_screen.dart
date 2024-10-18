import 'package:flutter/material.dart';
import 'package:p1_flutter_2/model/order_model.dart';
import 'package:provider/provider.dart';

class OrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var order = Provider.of<OrderModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Resumo do Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  var item = order.items[index];
                  return ListTile(
                    title: Text(item.name, style: TextStyle(color: Colors.white)),
                    subtitle: Text('Quantidade: ${item.quantity}', style: TextStyle(color: Colors.grey[400])),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove, color: Colors.redAccent), 
                          onPressed: () {
                            if (item.quantity > 1) {
                              item.quantity--;
                              order.notifyListeners();  
                            } else {
                              order.removeItem(item);  
                            }
                          },
                        ),
                        Text(
                          '${item.quantity}', 
                          style: TextStyle(color: Colors.white),  
                        ),
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.redAccent),  
                          onPressed: () {
                            item.quantity++;
                            order.notifyListeners();  
                          },
                        ),
                      ],
                    ),
                    onLongPress: () {
                      order.removeItem(item);
                    },
                  );
                },
              ),
            ),
            Divider(color: Colors.grey),  
            ListTile(
              title: Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              trailing: Text('R\$ ${order.totalPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.red)),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                order.clearOrder(); 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pedido confirmado!')),
                );
                Navigator.pop(context);
              },
              child: Text('Confirmar Pedido'),
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
