import 'package:flutter/material.dart';
import 'package:imconcept/models/product.dart';
import 'package:imconcept/pages/home/widgets/DetailSliver.dart';
import 'package:imconcept/pages/home/widgets/ProductInfo.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage(this.product, {super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliver(
              product: product,
              expandedHeight: 360,
              roundedContainerHeight: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: ProductInfo(
              product: product,
            ),

          ),
        ],
      ),
    );
  }
}
