import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:imconcept/pages/home/widgets/DevisPage.dart';
import 'package:imconcept/pages/home/widgets/ProfilPage.dart';
import 'package:imconcept/pages/home/widgets/RendezVousPage.dart';
import 'package:imconcept/pages/home/widgets/header.dart';
import 'package:imconcept/pages/home/widgets/search.dart';
import 'package:imconcept/pages/home/widgets/ServicesList.dart';
import 'package:imconcept/pages/home/home.dart';

class ArchitectInterieurPage extends StatefulWidget {
  const ArchitectInterieurPage({Key? key}) : super(key: key);

  @override
  _ArchitectInterieurPageState createState() => _ArchitectInterieurPageState();
}

class _ArchitectInterieurPageState extends State<ArchitectInterieurPage> {
  int _selectedIndex = 0; // Track the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected index
    });

    // Navigate to different pages based on the index
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const ArchitectInterieurPage(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DevisPage(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>  RendezVousPage(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>  ProfilPage(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4BE36),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Transform(
                  transform: Matrix4.identity()..rotateZ(20),
                  origin: const Offset(150, 50),
                  child: Image.asset(
                    'assets/images/bg_liquid.png',
                    width: 200,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 200,
                  child: Transform(
                    transform: Matrix4.identity()..rotateZ(20),
                    origin: const Offset(180, 100),
                    child: Image.asset(
                      'assets/images/bg_liquid.png',
                      width: 200,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const HeaderSection(),
                    const SearchSection(),
                    ServicesList(),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + -10,
            left: 10,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        },
        backgroundColor: const Color(0xFFF4BE36),
        child: const Icon(
          Icons.home_rounded,
          color: Colors.black,
          size: 28,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(

        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.work_rounded),
            label: 'Project',
          ),
          CurvedNavigationBarItem(
          child: Icon(Icons.request_quote_rounded),
            label: 'Devis',
          ),
          CurvedNavigationBarItem(
    child: Icon(Icons.event_rounded),
            label: 'Rendez-vous',
          ),
          CurvedNavigationBarItem(
    child: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
        index: _selectedIndex,
        height: 60.0,
        backgroundColor: const Color(0xFFF4BE36),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped,


      ),
    );
  }
}
