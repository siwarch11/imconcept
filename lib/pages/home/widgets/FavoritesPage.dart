import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:imconcept/models/product.dart';
import 'package:imconcept/pages/home/widgets/CartPage.dart';
import 'package:imconcept/pages/home/widgets/ProductDetailPage.dart';
import 'package:imconcept/pages/home/widgets/ProductListSection.dart';
import 'package:imconcept/pages/home/widgets/ProfilPagegr.dart';

class FavoritesPage extends StatefulWidget {
  final List<Product> favoriteProducts;
  FavoritesPage({required this.favoriteProducts});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int _selectedIndex = 2; // Default to FavoritesPage

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
        Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
        break;
      case 2:
      // No action needed as it's already the current page
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilPagegr()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vos Favoris',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF4BE36),
      ),
      body: widget.favoriteProducts.isEmpty
          ? Center(
        child: Text('Votre liste de produits favoris est vide.'),
      )
          : GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        itemCount: widget.favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = widget.favoriteProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product),
                ),
              );
            },
            child: Card(
              elevation: 5,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        child: Image.asset(
                          product.bgImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(Icons.favorite, color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      product.description,
                      style: TextStyle(color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "\$${product.price.toString()}",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductListSection(),
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
