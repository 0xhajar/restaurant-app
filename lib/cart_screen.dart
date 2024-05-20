import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dishes_view_model.dart';
import 'cart_item_widget.dart';
import 'cart_item.dart';  // Assurez-vous d'importer ici aussi

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Consumer<DishesViewModel>(
        builder: (context, viewModel, child) {
          final cart = viewModel.cart;  // Assurez-vous que cette ligne est correcte
          final total = viewModel.getTotalPrice();

          return Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: 512,
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) => CartItemWidget(cartItem: cart[index]),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Total: ${total.toStringAsFixed(2)} €',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
