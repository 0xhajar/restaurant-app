import 'package:flutter/material.dart';
import 'dish.dart';
import 'cart_item.dart';

class DishesViewModel extends ChangeNotifier {
  List<Dish> _dishes = [];
  List<CartItem> _cart = [];
  bool _isLoading = true;

  List<Dish> get dishes => _dishes;
  List<CartItem> get cart => _cart;  // Assurez-vous que cette ligne est présente
  bool get isLoading => _isLoading;

  DishesViewModel() {
    fetchDishes();
  }

  Future<void> fetchDishes() async {
    try {
      _dishes = await Dish.fetchDishes();
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void addToCart(Dish dish) {
    CartItem? existingItem = _cart.firstWhere(
          (item) => item.dish.id == dish.id,
      orElse: () => CartItem(dish: dish, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _cart.add(CartItem(dish: dish));
    } else {
      existingItem.quantity += 1;
    }
    notifyListeners();
  }

  void removeFromCart(Dish dish) {
    CartItem? existingItem = _cart.firstWhere(
          (item) => item.dish.id == dish.id,
      orElse: () => CartItem(dish: dish, quantity: 0),
    );

    if (existingItem.quantity > 1) {
      existingItem.quantity -= 1;
    } else {
      _cart.removeWhere((item) => item.dish.id == dish.id);
    }
    notifyListeners();
  }

  int getCartQuantity() {
    return _cart.fold(0, (total, item) => total + item.quantity);
  }

  double getTotalPrice() {
    return _cart.fold(0, (total, item) => total + item.dish.price * item.quantity);
  }
}
