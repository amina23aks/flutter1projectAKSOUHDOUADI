import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:projet1flutter/pages/menu.dart';
import 'package:projet1flutter/widgets/AllItemsWidget.dart';
import 'package:projet1flutter/widgets/HomeBottomNavBar.dart';
import 'package:projet1flutter/widgets/RowItemsWideget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> favoriteItems = [];
  String selectedCategory = 'All'; // Default selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(username: 'simon baker', email: 'simon baker@Gmail.com'), // Using the custom drawer
      appBar: AppBar(
        backgroundColor: Color(0xFF475269),
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFF5F9FD),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF475269).withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            // badge widget
            child: badges.Badge(
              badgeContent: Text(
                "3",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Color(0xFF475369),
              ),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 55,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F9FD),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF475269).withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ]
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      size: 27,
                      color: Color(0xFF475269),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Categories Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'All';
                      });
                    },
                    child: CategoryCard(
                      title: 'All',
                      isSelected: selectedCategory == 'All',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Men';
                      });
                    },
                    child: CategoryCard(
                      title: 'Men',
                      isSelected: selectedCategory == 'Men',
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = 'Women';
                      });
                    },
                    child: CategoryCard(
                      title: 'Women',
                      isSelected: selectedCategory == 'Women',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              RowItemsWideget(),
              SizedBox(height: 20),
              AllItemsWidget(selectedCategory: selectedCategory),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomNavBar(favoriteItems: favoriteItems),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CategoryCard({
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFF5F9FD),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Color(0xFF475269) : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF475269).withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFF475269),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
