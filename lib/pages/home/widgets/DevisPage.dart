import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:imconcept/pages/home/home.dart';
import 'package:imconcept/pages/home/widgets/ArchitectInterieurPage.dart';
import 'package:imconcept/pages/home/widgets/ProfilPage.dart';
import 'package:imconcept/pages/home/widgets/RendezVousPage.dart';

class DevisPage extends StatefulWidget {
  @override
  _DevisPageState createState() => _DevisPageState();
}

class _DevisPageState extends State<DevisPage> {
  final _formKey = GlobalKey<FormState>();
  String? _nom;
  String? _localisation;
  String? _typeProjet;
  double? _superficie;
  String? _typeServices;
  File? _photo;
  int _selectedIndex = 1;

  // Navigate to different pages based on the index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Using a map for cleaner navigation
    final pages = [
      ArchitectInterieurPage(),
      DevisPage(),
      RendezVousPage(),
      ProfilPage(),
    ];

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8FF),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 38.0),
              _buildHeader(),
              const SizedBox(height: 16.0),
              _buildResponsesButton(),
              Expanded(child: _buildForm()),
            ],
          ),
          _buildHomeButton(),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  // Header widget
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            'Demande de Devis',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Button for viewing responses
  Widget _buildResponsesButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              // Logic to display quotes responses
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF4BE36),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Les réponses',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Form widget
  Widget _buildForm() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F8FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextFormField('Nom', (value) {
                  _nom = value;
                }),
                const SizedBox(height: 16.0),
                _buildTextFormField('Localisation', (value) {
                  _localisation = value;
                }),
                const SizedBox(height: 16.0),
                _buildDropdown('Type de projet', ['Domestique', 'Habilitation', 'Commercial', 'Restauration', 'Autre'], (value) {
                  _typeProjet = value;
                }),
                const SizedBox(height: 16.0),
                _buildTextFormField('Superficie (m²)', (value) {
                  _superficie = value != null ? double.tryParse(value) : null;
                }, keyboardType: TextInputType.number),
                const SizedBox(height: 16.0),
                _buildDropdown('Type de service', ['Conception', 'Conception et suivie', 'Clé en main'], (value) {
                  _typeServices = value;
                }),
                const SizedBox(height: 16.0),
                _buildImagePicker(),
                const SizedBox(height: 16.0),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Text form field generator
  Widget _buildTextFormField(String label, Function(String?)? onSaved, {TextInputType? keyboardType}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Veuillez entrer $label';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  // Dropdown generator
  Widget _buildDropdown(String label, List<String> items, Function(String?)? onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: items.map((type) => DropdownMenuItem(
        value: type,
        child: Text(type),
      )).toList(),
      validator: (value) {
        if (value == null) {
          return 'Veuillez sélectionner un $label';
        }
        return null;
      },
      onChanged: onChanged,
    );
  }

  // Image picker
  Widget _buildImagePicker() {
    return GestureDetector(
      onTap: () async {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          setState(() {
            _photo = File(pickedFile.path);
          });
        }
      },
      child: _photo == null
          ? Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            'Ajouter une photo',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      )
          : Image.file(
        _photo!,
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }

  // Submit button
  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _saveForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF4BE36),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Envoyer la demande',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  // Home button
  Widget _buildHomeButton() {
    return Positioned(
      right: 16,
      bottom: 70,
      child: FloatingActionButton(
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
    );
  }

  // Bottom navigation bar
  Widget _buildBottomNavigationBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CurvedNavigationBar(
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

  // Save form function
  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Handle form submission logic (e.g., send data to a server)
      print('Nom: $_nom, Localisation: $_localisation, Type Projet: $_typeProjet, Superficie: $_superficie, Type Services: $_typeServices, Photo: $_photo');
    }
  }
}
