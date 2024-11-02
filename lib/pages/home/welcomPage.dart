import 'package:flutter/material.dart';
import 'package:imconcept/pages/home/widgets/SignPage.dart';
import 'package:imconcept/pages/home/widgets/connexion.dart';
import 'package:imconcept/pages/home/widgets/delayed_animation.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // To get the screen size

    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Using the available space based on the screen size
              DelayedAnimation(
                delay: 1000,
                child: Container(
                  height: size.height * 0.15, // Height proportional to screen
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),



              DelayedAnimation(
                delay: 2000,
                child: Container(
                  height: size.height * 0.35, // More responsive height
                  child: Image.asset('assets/images/wlcc.png'),
                ),
              ),

              SizedBox(height: size.height * 0.04), // Spacing for the text

              DelayedAnimation(
                delay: 3000,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: Text(
                    "Simplicity is about subtracting the obvious and adding the meaningful",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.05), // Spacing before the button

              DelayedAnimation(
                delay: 4000,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4BE36),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(13),
                    ),
                    child: const Text('GET STARTED', style: TextStyle( color: Colors.black54) ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Connexion(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
