import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_item.dart';
import 'dishes_view_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget({required this.cartItem, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(cartItem.dish.imagePath),
      title: Text(cartItem.dish.name),
      subtitle: Text('Price: ${cartItem.dish.price.toStringAsFixed(2)} €'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              Provider.of<DishesViewModel>(context, listen: false).removeFromCart(cartItem.dish);
            },
          ),
          Text('${cartItem.quantity}'),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Provider.of<DishesViewModel>(context, listen: false).addToCart(cartItem.dish);
            },
          ),
        ],
      ),
    );
  }
}
