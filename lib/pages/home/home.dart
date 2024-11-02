import 'package:flutter/material.dart';
import 'package:imconcept/pages/home/widgets/ArchitectInterieurPage.dart';
import 'package:imconcept/pages/home/widgets/category.dart';
import 'package:imconcept/pages/home/widgets/header.dart';
import 'package:imconcept/pages/home/widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color(0xFFF4BE36),
body: SingleChildScrollView(
  child: Stack(
    children:[
      Transform(
        transform: Matrix4.identity()..rotateZ(20),
        origin:const Offset(150,50),
        child:Image.asset(
        'assets/images/bg_liquid.png',
            width:200),),
    Positioned(
      right: 0,
      top:200,
      child: Transform(
      transform: Matrix4.identity()..rotateZ(20),
      origin:const Offset(180,100),
      child:Image.asset(
          'assets/images/bg_liquid.png',
          width:200),
      ),
    ),
    Column(
      children: [
        const HeaderSection(),
        SearchSection(),
        CategorySection(),


      ],
    )],
  )
),
    );
  }
}
