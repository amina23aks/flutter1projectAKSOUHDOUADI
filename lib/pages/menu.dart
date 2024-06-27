import 'package:flutter/material.dart';
import 'package:projet1flutter/pages/LoginPage.dart';
import 'package:projet1flutter/pages/Signin.dart';

class CustomDrawer extends StatelessWidget {
  final String username;
  final String email;

  CustomDrawer({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF475269),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  email,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text('Sign In'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SigninPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}




