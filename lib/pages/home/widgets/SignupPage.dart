import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:imconcept/pages/home/home.dart'; // Adjust import based on your project structure

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var _obscureText = true;
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding( // Added padding to the whole column
          padding: const EdgeInsets.symmetric(horizontal: 30.0), // Adjust horizontal padding
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create your account",
                      style: GoogleFonts.poppins(
                        color: Color(0xfff4be36),
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 22),
                    Text(
                      "Please fill in your details below to sign up.",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _image != null ? FileImage(_image!) : null,
                  child: _image == null
                      ? Icon(Icons.camera_alt, size: 50, color: Colors.grey[700])
                      : null,
                ),
              ),
              SizedBox(height: 30), // Space after the image picker
              // Email Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Your Email',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30), // Space between fields
              // Password Field
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 30), // Space between fields
              // Phone Number Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30), // Space between fields
              // Address Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              // Sign Up Button
              ElevatedButton(
                onPressed: () {
                  // Implement signup logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(), // Adjust as needed
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Color(0xfff4be36),
                  padding: EdgeInsets.symmetric(horizontal: 125, vertical: 13),
                ),
                child: Text(
                  'SIGN UP',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }
}
