import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:imconcept/models/product.dart';
import 'package:imconcept/pages/home/home.dart';
import 'package:imconcept/pages/home/widgets/FavoritesPage.dart';
import 'package:imconcept/pages/home/widgets/ProductListSection.dart';
import 'package:imconcept/pages/home/widgets/ProfilPagegr.dart';
import 'package:imconcept/pages/home/widgets/cart.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _selectedIndex = 1; // Default to CartPage
  final List<Product> products = Product.products();
  List<Product> favoriteProducts = []; // List to store favorite products

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProductListSection()),
        );
        break;
      case 1:
      // No action needed as it's already the current page
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FavoritesPage(favoriteProducts: favoriteProducts)),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilPagegr()),
        );
        break;
    }
  }

  void _removeFromCart(int index) {
    setState(() {
      Cart.instance.cartItems.removeAt(index);
    });
  }

  void _showOrderDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informations de Commande'),
          content: OrderForm(),
          actions: <Widget>[
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Valider la Commande'),
              onPressed: () {
                // Handle order placement logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Commande passée avec succès!')),
                );
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice = Cart.instance.totalPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Votre Panier',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF4BE36),
      ),
      body: Column(
        children: [
          Expanded(
            child: Cart.instance.cartItems.isEmpty
                ? Center(
              child: Text(
                'Votre panier est vide.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
                : ListView.builder(
              itemCount: Cart.instance.cartItems.length,
              itemBuilder: (context, index) {
                final item = Cart.instance.cartItems[index];
                final product = item['product'];
                final quantity = item['quantity'];
                final comment = item['comment'];

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.asset(
                      product.examples.isNotEmpty
                          ? product.examples[0]
                          : 'assets/images/default_image.png',
                      fit: BoxFit.cover,
                      width: 60,
                      height: 60,
                    ),
                    title: Text(
                      product.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${product.category}\nQuantity: $quantity\nComment: $comment',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${(product.price * quantity).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => _removeFromCart(index),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF4BE36),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 6), // Add vertical space before the button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Added vertical padding
            child: ElevatedButton(
              onPressed: _showOrderDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF4BE36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 12), // Increase padding for better appearance
              ),
              child: Center(
                child: Text(
                  'Passer la Commande',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 25), // Space between button and bottom navigation bar
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        },
        backgroundColor: const Color(0xFFF4BE36),
        child: const Icon(
          Icons.home_rounded,
          size: 28,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.message_rounded),
            label: 'Product',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart_rounded),
            label: 'Panier',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.favorite_rounded),
            label: 'Favoris',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
        index: _selectedIndex,
        height: 60.0,
        backgroundColor: const Color(0xFFF4BE36),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped,
      ),
    );
  }
}

class OrderForm extends StatelessWidget {
  const OrderForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Pays / Région'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Nom et numéro de rue'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Ville'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Code Postal'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Numéro de Téléphone'),
          ),
        ],
      ),
    );
  }
}
