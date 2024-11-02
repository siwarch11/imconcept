import 'package:imconcept/models/product.dart';

class Cart {
  // Private constructor for singleton pattern
  Cart._privateConstructor();
  static final Cart _instance = Cart._privateConstructor();

  // Singleton instance getter
  static Cart get instance => _instance;

  // List to store cart items
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Product product, int quantity, String comment) {
    _cartItems.add({
      'product': product,
      'quantity': quantity,
      'comment': comment,
    });
  }

  double get totalPrice => _cartItems.fold(
    0,
        (sum, item) => sum + (item['product'].price * item['quantity']),
  );

  void clearCart() {
    _cartItems.clear();
  }
}
