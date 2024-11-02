import 'package:flutter/material.dart';
import 'package:imconcept/models/service.dart';

import 'package:imconcept/pages/home/widgets/DetailPage.dart';

class NewestProjet extends StatelessWidget {
  final String category;

  NewestProjet({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Recuperation de la Liste des services a partir du model
    final services = Service.services(category: category);

    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: services
            .map(
              (service) => GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(service),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      service.icon,
                      width: 30,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          service.description,
                          style: TextStyle(
                            color: Colors.grey.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: service.examples.map((example) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  example,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}