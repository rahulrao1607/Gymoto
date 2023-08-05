import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../usda/home.dart';
import '../Tracker Meal/Pages/home_track.dart';
import '../Yoga and excercise/Yogafeatures/home/yView/yoga_splash.dart';
import '../diet recommendation/user_Info.dart';
import '../features/screens/splash_screen/shoopingSplash.dart';
import '../profile/profile_page.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  final FirebaseStorage storage = FirebaseStorage.instance;

  // details
  String? email;
  String? name;
  String? phone;
  // default dp
  String image ='https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png';

  Future<void> _getUser() async {
    user = _auth.currentUser!;
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    setState(() {
      var snapshot = snap.data() as Map<String, dynamic>;
      email = snapshot['email'];
      name = snapshot['name'];
      phone = snapshot['phone'];
      image = snapshot['profilePhoto'] ?? image;
    });
  }
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }


  @override
  void initState() {
    super.initState();
    _getUser();
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(" ${name}"),
            accountEmail: Text(" ${user.email}"),
            currentAccountPicture: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(image),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart_rounded),
            title: const Text('Shopping'),
            onTap: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => const ShoppingSplash()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_alt),
            title: const Text('Track Record'),
            onTap: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => const Habbit()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.sports_gymnastics_rounded),
            title: const Text('Our Favourites'),
            onTap: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) =>  SplashScreen2()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.pie_chart),
            title: const Text('Diet Plan'),
            onTap: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) =>  UserInfoFormScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Food data'),
            onTap: () {
              Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => const HomeScreen2()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyProfile()));
            },
          ),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}