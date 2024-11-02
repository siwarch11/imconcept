import 'package:flutter/material.dart';
class SearchSection extends StatelessWidget {
  const SearchSection ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      //color: Colors.white,
      padding:const EdgeInsets.symmetric(horizontal: 25, vertical: 30) ,
      child: Stack(
        children: [
          TextField(
            decoration:InputDecoration(
      fillColor: const Color(0xFFF6F8FF),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
              prefixIcon: const Icon(
              Icons.search_outlined,
              size: 30,
            ),
              hintText: "Search service",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
          ),
          Positioned(
          bottom: 10,
          right: 12,
    child: Container(
    padding: const EdgeInsets.all(5),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: const Color(0xFFFFFFFF),
    ),
      child: const Icon(
        Icons.mic_outlined,
        color: Colors.black,
        size: 25,
      ),
          ),
          ),
        ],
      )
    );
  }
}
