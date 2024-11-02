import 'package:imconcept/models/review.dart';

class Service {
  final String bgImage;
  final String icon;
  final String name;
  final String description;
  final List<String> examples;
  final String category;
  final double score;
  final String reviews;
  final List<Review> reviewList;

  Service({
    required this.bgImage,
    required this.icon,
    required this.name,
    required this.description,
    required this.examples,
    required this.category,
    required this.score,
    required this.reviews,
    required this.reviewList,
  });

  static List<Service> services({String? category}) {
    List<Service> allServices = [
      Service(
        bgImage: 'assets/images/conception_bg.jpg',
        icon: 'assets/images/conception_icon.png',
        name: 'Conception',
        description: "Notre service de conception inclut l'analyse des besoins, la création de plans et de designs innovants pour transformer vos espaces.",
        examples: [
          'assets/images/conception_bg.jpg',
          'assets/images/concept1.jpg',
          'assets/images/concept2.jpg',
        ],
        category: 'Conception',
        score: 4.7,
        reviews: '123 reviews',
        reviewList: [
          Review(
            userName: 'youssef chtioui',
            userAvatar: 'assets/images/user_avatar.png',
            comment: 'Great service, highly recommend!',
          ),
          Review(
              userName: 'mohamed chtioui',
              userAvatar: 'assets/images/user_avatar.png',
              comment: 'Excellent work, I`m very satisfied.',
          ),
        ],
      ),
      Service(
        bgImage: 'assets/images/suiv3.jpg',
        icon: 'assets/images/conception_icon.png',
        name: 'Conception et suivi',
        description: "Ce service inclut la conception et le suivi complet des travaux, garantissant la réalisation conforme de votre projet.",
        examples: [
          'assets/images/suiv1.jpg',
          'assets/images/suiv2.jpeg',
          'assets/images/suiv3.jpg',
        ],
        category: 'Conception et suivie',
        score: 4.7,
        reviews: '78 reviews',
        reviewList: [
          Review(
            userName: 'youssef chtioui',
            userAvatar: 'assets/images/user_avatar.png',
            comment: 'Great service, highly recommend!',
          ),
          Review(
            userName: 'mohamed chtioui',
            userAvatar: 'assets/images/user_avatar.png',
            comment: 'Excellent work, I`m very satisfied.',
          ),
        ],
      ),
      Service(
        bgImage: 'assets/images/cle2.jpg',
        icon: 'assets/images/conception_icon.png',
        name: 'clé en main',
        description: "Nous prenons en charge tout le projet, de la conception à la réalisation finale, pour vous offrir un espace prêt à l'emploi.",
        examples: [
          'assets/images/cle1.jpeg',
          'assets/images/cle2.jpg',
          'assets/images/cle3.jpg',
        ],
        category: 'clé en main',
        score: 4.7,
        reviews: '45 reviews',
        reviewList: [
          Review(
            userName: 'youssef chtioui',
            userAvatar: 'assets/images/user_avatar.png',
            comment: 'Great service, highly recommend!',
          ),
          Review(
            userName: 'mohamed chtioui',
            userAvatar: 'assets/images/user_avatar.png',
            comment: 'Excellent work, I`m very satisfied.',
          ),
        ],
      ),
    ];

    if (category != null) {
      return allServices.where((service) => service.category == category).toList();
    } else {
      return allServices;
    }
  }
}