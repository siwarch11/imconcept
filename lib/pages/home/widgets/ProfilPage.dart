import 'dart:io';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imconcept/pages/home/home.dart';
import 'package:imconcept/pages/home/widgets/ArchitectInterieurPage.dart';
import 'package:imconcept/pages/home/widgets/DevisPage.dart';
import 'package:imconcept/pages/home/widgets/RendezVousPage.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  int _selectedIndex = 3; // Set the selected index to the profile page
  final TextEditingController _emailController = TextEditingController(text: 'email@example.com');
  final TextEditingController _phoneController = TextEditingController(text: '+123 456 7890');
  final TextEditingController _addressController = TextEditingController(text: 'City, Country');
  final ImagePicker _picker = ImagePicker();
  XFile? _profileImage;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages based on the index
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ArchitectInterieurPage(),
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
            builder: (context) => RendezVousPage(),
          ),
        );
        break;
      case 3:
      // Current page
        break;
    }
  }

  void _editProfile() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(backgroundColor: const Color(0xFFF5F7FE),
          title: const Text('Modifier le Profil'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color(0xFFF4BE36),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: _profileImage != null
                        ? FileImage(File(_profileImage!.path))
                        : AssetImage('assets/images/avatarr.png') as ImageProvider,backgroundColor: Color(0xFFF6F8FF),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {
                        _profileImage = pickedImage;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4BE36), // Yellow background color
                    foregroundColor: Colors.black, // Text color
                  ),
                  child: const Text('Changer l\'image'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Téléphone'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Adresse'),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Mot de passe'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFF4BE36), // Yellow text color
              ),
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                // Save profile updates
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFF4BE36), // Yellow text color
              ),
              child: const Text('Sauvegarder'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFFF5F7FE),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF5F7FE), // Background color similar to RendezVousPage
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: const Color(0xFFF4BE36),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: _profileImage != null
                        ? FileImage(File(_profileImage!.path))
                        : AssetImage('assets/images/avatarr.png') as ImageProvider,backgroundColor: Color(0xFFF6F8FF)
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'siwar chtioui',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'siwarcht@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.phone, color: Color(0xFFF4BE36)),
                    title: const Text('Téléphone'),
                    subtitle: const Text('+216 52 516 561'),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.location_on, color: Color(0xFFF4BE36)),
                    title: const Text('Adresse'),
                    subtitle: const Text('Sousse, Msaken'),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _editProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4BE36),
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Modifier le Profil',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomePage(),
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
