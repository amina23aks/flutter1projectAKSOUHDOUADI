import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowItemsWideget extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'name': 'Rolex Datejust bleu', 'subTitle': 'Watch For Men', 'price': '50', 'image': '1.png'},
    {'name': 'Rolex  Wimbledon', 'subTitle': 'Watch For Women', 'price': '75', 'image': '2.png'},
    {'name': 'Rolex Datejust green', 'subTitle': 'Watch For Men', 'price': '60', 'image': '3.png'},
    {'name': 'Rolex Oyster Perpetual', 'subTitle': 'Watch For Women', 'price': '80', 'image': '4.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return Container(
            margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 180,
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
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 15),
                      height: 110,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF475269),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Image.asset(
                      "images/${item['image']}",
                      height: 150,
                      width: 150,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: TextStyle(
                          color: Color(0xFF475269),
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item['subTitle']!,
                        style: TextStyle(
                          color: Color(0xFF475269).withOpacity(0.8),
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            "\$${item['price']}",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 70),
                          
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
