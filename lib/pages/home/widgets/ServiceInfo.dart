import 'package:flutter/material.dart';
import 'package:imconcept/models/service.dart';
import 'package:imconcept/pages/home/widgets/DescriptionSection.dart';
import 'package:imconcept/pages/home/widgets/GallerySection.dart';
import 'package:imconcept/pages/home/widgets/HeaderSection.dart';
import 'package:imconcept/pages/home/widgets/ReviewSection.dart';

class ServiceInfo extends StatelessWidget {
  final Service service;

  const ServiceInfo(this.service, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HeaderSection(service),
          GallerySection(service),
          DescriptionSection(service),
          ReviewSection(service)
        ],
      ),
    );
  }
}
