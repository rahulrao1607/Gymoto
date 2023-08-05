import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymoto/src/profile/profile_page.dart';
import 'package:gymoto/src/shopping/category_screen/men_cat.dart';
import 'package:gymoto/src/shopping/category_screen/shoe_cat.dart';
import 'package:gymoto/src/shopping/screens2/cart.dart';
import 'package:gymoto/src/shopping/screens2/home.dart';
import 'package:gymoto/src/shopping/screens2/search.dart';
import 'package:gymoto/src/utils/constant.dart';
import 'package:line_icons/line_icons.dart';


class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  final int _index = 0;
  bool isSearchActive = false;

  List<Widget> screens = [
    const Home(),
    const Search(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearchActive
            ? FadeIn(
          delay: const Duration(milliseconds: 300),
          child: const Text(
            "Search",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        )
            : FadeIn(
          delay: const Duration(milliseconds: 300),
          child: const Text(
            "Home",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Ink.image(image: const AssetImage(
            "assets/logo/yoga_trasparent.png"
        ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchActive = !isSearchActive;
              });
            },
            icon: isSearchActive
                ? const Icon(
              LineIcons.searchMinus,
              color: Colors.black,
              size: 30,
            )
                : const Icon(
              LineIcons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                LineIcons.shoppingBag,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: isSearchActive ? const Search() : const Home(),
      bottomNavigationBar: BottomBarBubble(
        color: primaryColor,
        selectedIndex: _index,
        items: [
          BottomBarItem(iconData: Icons.home),
          BottomBarItem(iconData: Icons.search),
          BottomBarItem(iconData: Icons.explore),
          BottomBarItem(iconData: Icons.settings),
          BottomBarItem(iconData: Icons.mail),
        ],
        onSelect: (index) {
          switch (index){
            case 0:
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => const MainWrapper()));
              break;
            case 1:
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => const Search()));
              break;
            case 2:
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => const Shoecat()));
              break;
            case 3:
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => const MyProfile()));
              break;
            case 4:
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => const Menscat()));
              break;
          }
        },
      ),
    );
  }
}