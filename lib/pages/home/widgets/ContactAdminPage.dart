import 'package:flutter/material.dart';

class ContactAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contactez l\'Admin'),
          backgroundColor: const Color(0xFFF4BE36),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
          TextField(
          decoration: InputDecoration(
          labelText: 'Message',
            border: OutlineInputBorder(),
          ),
          maxLines: 4,
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
        onPressed: () {
      // Submit message logic
    },
    child: Text('Envoyer le message'), style: ElevatedButton.styleFrom( backgroundColor: const Color(0xFFF4BE36), ), ), ], ), ), ); } }
