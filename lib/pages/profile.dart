import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/SimonBaker.jpg'), 
            ),
            SizedBox(height: 16),
            Text(
              'simon baker',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('simon baker@Gmail.com'),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('055555555'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Adresse'),
            ),
            
           
          ],
        ),
      ),
    );
  }
}
