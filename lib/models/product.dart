import 'package:imconcept/models/review.dart';
class Product {
  final String name;
  final String description;
  final String category;
  final String bgImage;
  final List<String> examples;
  final double heart;
  final double price;
  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.bgImage,
    required this.examples,

    required this.heart,
    required this.price,

  });

  static List<Product> products() {
    return [
      Product(
        name: "Product 1",
        description: "Description of Product 1 an amazing mug for you",
        category: "Invitation Mariage",
        bgImage: "assets/images/mug.jpg",
        examples: [
          'assets/images/mug1.jpg',
          'assets/images/mug2.jpg',
          'assets/images/mug3.jpeg',
        ],
        heart: 4.5,
        price:23
      ),
      Product(
        name: "Product 2",
        description: "Description of Product 2",
        category: "Article Cadeaux",
        bgImage: "assets/images/invitation.jpg",
        examples: [
          'assets/images/conception_bg.jpg',
          'assets/images/conception_bg.jpg',
          'assets/images/conception_bg.jpg',
        ],
        heart: 4.0,
        price:34
      ), Product(
          name: "Product 3",
          description: "Description of Product 3",
          category: "Article Publicitaire",
          bgImage: "assets/images/cadeau.png",
          examples: [
            'assets/images/cadeau.png',
            'assets/images/cadeau.png',
            'assets/images/cadeau.png',
          ],
          heart: 4.0,
          price:34
      ), Product(
          name: "Product 4",
          description: "Description of Product 4",
          category: "Article Tableaux",
          bgImage: "assets/images/tab.png",
          examples: [
            'assets/images/tab.png',
            'assets/images/tab.png',
            'assets/images/tab.png',
          ],
          heart: 4.0,
          price:34
      ),Product(
          name: "Product 4",
          description: "Description of Product 4",
          category: "Article Tableaux",
          bgImage: "assets/images/tab.png",
          examples: [
            'assets/images/tab.png',
            'assets/images/tab.png',
            'assets/images/tab.png',
          ],
          heart: 4.0,
          price:34
      ),
    ];


  }
}