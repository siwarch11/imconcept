import 'package:flutter/material.dart';
import 'package:imconcept/models/product.dart';

class HeaderDetail extends StatelessWidget {
  final Product product;
  const HeaderDetail(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Image.asset(
            product.bgImage,
            width: 80,
          ),
          const SizedBox(width: 15),
          Expanded(  // To ensure proper spacing and wrapping of text
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.category,
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 5),

                // Adding heart and price information in separate rows
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Heart section


                    // Price section
                    Row(
                      children: [
                        Text(
                          "${product.price.toString()} €",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
