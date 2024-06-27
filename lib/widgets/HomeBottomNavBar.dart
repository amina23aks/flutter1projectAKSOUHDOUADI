import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet1flutter/pages/profile.dart';
import 'package:projet1flutter/widgets/BottomCartSheet.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
import 'package:projet1flutter/pages/FavoritePage.dart'; // Import the FavoritePage

class HomeBottomNavBar extends StatelessWidget {
  final List<String> favoriteItems;

  HomeBottomNavBar({required this.favoriteItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFF475269),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              showSlidingBottomSheet(context, builder: (context) {
                return SlidingSheetDialog(
                  elevation: 8,
                  cornerRadius: 16,
                  builder: (context, state) {
                    return BottomCartSheet();
                  },
                );
              });
            },
            child: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.white,
              size: 32,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritePage(favoriteItems: favoriteItems)),
              );
            },
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 32,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
