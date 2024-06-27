import 'package:flutter/material.dart';
import 'package:projet1flutter/pages/HomePage.dart';
import 'package:projet1flutter/pages/ItemPage.dart';
import 'package:projet1flutter/pages/LoginPage.dart';
import 'package:projet1flutter/models/cart_provider.dart';
import 'package:projet1flutter/pages/Signin.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFCEDDEE)),
      routes: {
        "/": (context) => LoginPage(),
        "homePage": (context) => HomePage(),
        "signinPage": (context) => SigninPage(),
        
      },
      onGenerateRoute: (settings) {
        if (settings.name == "itemPage") {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) {
              return ItemPage(
                name: args['name']!,
                subTitle: args['subTitle']!,
                price: args['price']!,
                image: args['image']!,
                description: args['description']!
                
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
