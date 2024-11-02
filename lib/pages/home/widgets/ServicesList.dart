import 'package:flutter/material.dart';
import 'package:imconcept/pages/home/widgets/NewestProjet.dart';
import 'package:imconcept/pages/home/widgets/projetRealise.dart';

class ServicesList extends StatefulWidget {
  ServicesList({super.key});

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  final categories = [
    {
      'icon': Icons.track_changes_outlined,
      'color': const Color(0xFFF4BE36),
      'title': 'Conception'
    },
    {
      'icon': Icons.casino_outlined,
      'color': const Color(0xFFF4BE36),
      'title': 'Conception et suivie'
    },
    {
      'icon': Icons.sports_esports,
      'color': const Color(0xfff4be36),
      'title': 'clé en main'
    },
  ];

  int _selectedIndex = 0;
  bool _showConception = true;
  bool _showConceptionEtSuivie = false;
  bool _showCleEnMain = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 140,
              padding: const EdgeInsets.all(25),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: categories[index]['color'] as Color),
                        child: Icon(
                          categories[index]['icon'] as IconData,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categories[index]['title'] as String,
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.black
                              : Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                separatorBuilder: (_, index) => const SizedBox(width: 33),
                itemCount: categories.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: 410,
              child: const Text(
                'Projet Réalisé',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            projetRealise(),
            if (_selectedIndex == 0)
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: 410,
                    child: const Text(
                      'Conception',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  NewestProjet(category: 'Conception'),
                ],
              )
            else if (_selectedIndex == 1)
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    width: 410,
                    child: const Text(
                      'Conception et suivie',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  NewestProjet(category: 'Conception et suivie'),
                ],
              )
            else if (_selectedIndex == 2)
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      width: 410,
                      child: const Text(
                        'clé en main',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    NewestProjet(category: 'clé en main'),
                  ],
                ),
          ],
        ),
      ),
    );
  }}