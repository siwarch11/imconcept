import 'package:flutter/material.dart';
import 'package:imconcept/models/service.dart';
import 'package:imconcept/models/review.dart';
class ReviewSection extends StatefulWidget {
  final Service service;
  const ReviewSection(this.service, {super.key});

  @override
  State<ReviewSection> createState() => _ReviewSectionState();
}

class _ReviewSectionState extends State<ReviewSection> {
  final _commentController = TextEditingController();


  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Commentaires clients',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.service.reviewList.length,
            itemBuilder: (context, index) {
              final review = widget.service.reviewList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(review.userAvatar),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            review.userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            review.comment,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 25),
          TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Ajouter un commentaire',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  void _addComment() {
                    if (_commentController.text.isNotEmpty) {
                      setState(() {
                        widget.service.reviewList.add(
                          Review(
                            userName: 'You',
                            userAvatar: 'assets/images/user_avatar.png',
                            comment: _commentController.text,
                          ),
                        );
                        _commentController.clear();
                      });
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

