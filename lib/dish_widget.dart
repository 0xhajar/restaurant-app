import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dish.dart';
import 'dishes_view_model.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;

  const DishWidget({required this.dish});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(dish.imagePath),
      title: Text(dish.name),
      subtitle: Text('${dish.price.toStringAsFixed(2)} €'),
      trailing: IconButton(
        icon: const Icon(Icons.add_shopping_cart),
        onPressed: () {
          Provider.of<DishesViewModel>(context, listen: false).addToCart(dish);
        },
      ),
    );
  }
}
