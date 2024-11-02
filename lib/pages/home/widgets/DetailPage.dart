import 'package:flutter/material.dart';
import 'package:imconcept/models/service.dart';
import 'package:imconcept/pages/home/widgets/DetailSliverDelagate.dart';
import 'package:imconcept/pages/home/widgets/ServiceInfo.dart';


class DetailPage extends StatelessWidget {
  const DetailPage(this.service, {super.key});

  final Service service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              service: service,
              expandedHeight: 360,
              roundedContainerHeight: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: ServiceInfo(service),
          )
        ],
      ),
    );
  }
}
