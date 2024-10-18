import 'package:flutter/material.dart';
import 'package:p1_flutter_2/view/itens_details_screen.dart';
import 'order_summary_screen.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final List<String> categories = ['Entradas', 'Pratos Principais', 'Bebidas', 'Sobremesas'];

  final Map<String, List<Map<String, dynamic>>> items = {
    'Entradas': [
      {'name': 'Salada Caesar', 'description': 'Salada com alface, croutons e molho caesar.', 'price': 12.50},
      {'name': 'Sopa de Cebola', 'description': 'Sopa clássica de cebola com queijo gratinado.', 'price': 8.50},
      {'name': 'Bruschetta de Tomate', 'description': 'Fatias de pão com tomate, manjericão e queijo.', 'price': 10.00},
    ],
    'Pratos Principais': [
      {'name': 'Filé à Parmegiana', 'description': 'Filé empanado com molho de tomate e queijo.', 'price': 25.00},
      {'name': 'Risoto de Cogumelos', 'description': 'Risoto cremoso com cogumelos frescos e parmesão.', 'price': 30.00},
      {'name': 'Salmão Grelhado', 'description': 'Salmão grelhado com molho de limão e ervas.', 'price': 40.00},
    ],
    'Bebidas': [
      {'name': 'Refrigerante', 'description': 'Refrigerante de vários sabores.', 'price': 5.00},
      {'name': 'Suco Natural', 'description': 'Suco de frutas frescas.', 'price': 8.00},
      {'name': 'Vinho Tinto', 'description': 'Uma seleção de vinhos tintos.', 'price': 45.00},
    ],
    'Sobremesas': [
      {'name': 'Pudim de Leite', 'description': 'Pudim tradicional de leite condensado.', 'price': 7.00},
      {'name': 'Torta de Limão', 'description': 'Deliciosa torta de limão com merengue.', 'price': 10.00},
      {'name': 'Petit Gateau', 'description': 'Bolo de chocolate com interior cremoso.', 'price': 12.00},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderSummaryScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          var categoryItems = items[category] ?? [];

          return ExpansionTile(
            title: Text(category, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            children: categoryItems.map((item) {
              return Card(
                margin: EdgeInsets.all(8),
                color: Colors.grey[800],
                child: ListTile(
                  title: Text(item['name'], style: TextStyle(color: Colors.white)),
                  subtitle: Text(
                    item['description'] + '\nR\$ ${item['price'].toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailsScreen(
                          itemName: item['name'],
                          itemDescription: item['description'],
                          itemPrice: item['price'],
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/'); 
  }
}
