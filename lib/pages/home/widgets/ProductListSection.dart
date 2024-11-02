import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:imconcept/models/product.dart';
import 'package:imconcept/pages/home/home.dart';
import 'package:imconcept/pages/home/widgets/CartPage.dart';
import 'package:imconcept/pages/home/widgets/ContactAdminPage.dart';
import 'package:imconcept/pages/home/widgets/ProductDetailPage.dart';
import 'package:imconcept/pages/home/widgets/FavoritesPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:imconcept/pages/home/widgets/ProfilPagegr.dart';

class ProductListSection extends StatefulWidget {
  @override
  _ProductListSectionState createState() => _ProductListSectionState();
}

class _ProductListSectionState extends State<ProductListSection> {
  final List<Map<String, dynamic>> categories = [
    {"category": "Invitation Mariage", "icon": FontAwesomeIcons.scroll},
    {"category": "Article Publicitaire", "icon": FontAwesomeIcons.newspaper},
    {"category": "Article Cadeaux", "icon": FontAwesomeIcons.box},
    {"category": "Article Tableaux", "icon": FontAwesomeIcons.image},
  ];

  String? selectedCategory;
  bool _isContactOptionsExpanded = false;
  final List<Product> products = Product.products();
  List<Product> favoriteProducts = [];

  List<Product> get filteredProducts {
    if (selectedCategory == null) return products;
    return products.where((p) => p.category == selectedCategory).toList();
  }

  void _addToFavorites(Product product) {
    setState(() {
      if (!favoriteProducts.contains(product)) {
        favoriteProducts.add(product);
      }
    });
  }

  void _toggleContactOptions() {
    setState(() {
      _isContactOptionsExpanded = !_isContactOptionsExpanded;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FavoritesPage(favoriteProducts: favoriteProducts)),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilPagegr()),
        );
        break;
    }
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FE),
      appBar: AppBar(
        title: Text(
          'Produits',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFF4BE36),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = null;
                        });
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategory == category["category"];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category["category"];
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: const Color(0xFFF4BE36),
                              radius: 30,
                              child: Icon(
                                category["icon"],
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              width: 80,
                              child: Text(
                                category["category"]!,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
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
                                  child: GestureDetector(
                                    onTap: () {
                                      _addToFavorites(product);
                                    },
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
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
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: Text(
                                '\$${product.price}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Contact Options
          Positioned(
            right: 16,
            bottom: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isContactOptionsExpanded)
                  ...[
                    FloatingActionButton(
                      heroTag: 'telephone',
                      onPressed: () => _launchURL("tel:+123456789"),
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.phone),
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'whatsapp',
                      onPressed: () => _launchURL("https://wa.me/123456789"),
                      backgroundColor: Colors.green,
                      child: Icon(FontAwesomeIcons.whatsapp),
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'messenger',
                      onPressed: () => _launchURL("https://www.facebook.com/@magasin.prestigee?locale=fr_FR"),
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.message),
                      mini: true,
                    ),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      heroTag: 'instagram',
                      onPressed: () => _launchURL("https://www.instagram.com/im_graphics/"),
                      backgroundColor: Colors.purple,
                      child: Icon(FontAwesomeIcons.instagram),
                      mini: true,
                    ),
                  ],
                SizedBox(height: 28),
                FloatingActionButton(
                  onPressed: _toggleContactOptions,
                  backgroundColor: Colors.grey,
                  child: Icon(_isContactOptionsExpanded ? Icons.close : Icons.contact_mail,color:Colors.black),
                ),
              ],
            ),
          ),
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