import 'package:flutter/material.dart';
import 'package:imconcept/models/product.dart';
import 'package:readmore/readmore.dart';

class DescriptionDetail extends StatelessWidget {
  final Product product;
  const DescriptionDetail(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ReadMoreText(
        product.description,
        trimLines: 2,
        colorClickableText: const Color(0xFF5F67EA),
        trimMode: TrimMode.Line,
        trimCollapsedText: 'more',
        trimExpandedText: ' reduire',
        style: TextStyle(
          color: Colors.grey.withOpacity(0.7),
          height: 1.5,
        ),
      ),
    );
  }
}
