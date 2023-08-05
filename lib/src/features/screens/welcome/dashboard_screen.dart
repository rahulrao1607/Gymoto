import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gymoto/src/features/models/GridB.dart';
import 'package:gymoto/src/features/models/dashboardModel1.dart';
import 'package:gymoto/src/routing/Nav_bar.dart';
import 'package:gymoto/usda/home.dart';

import '../../../Yoga and excercise/Yogafeatures/home/yView/yoga_splash.dart';

import '../../../profile/profile_page.dart';
import '../../../shopping/data/app_data.dart';


class DasBoard extends StatefulWidget {
  DasBoard({Key? key}) : super(key: key);

  @override
  State<DasBoard> createState() => _DasBoardState();
}

class _DasBoardState extends State<DasBoard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(68, 68, 68, 36),
      key: _globalKey,
      drawer: NavBar(),
      body:Container(
        margin: const EdgeInsets.only(top: 4),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>
            [
              Container(
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap:(){
                        _globalKey.currentState?.openDrawer();
                      },
                        child: SvgPicture.asset("assets/svg/slider.svg"),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(25),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                        )
                      ),
                    )

                  ],
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16,bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:<Widget>[
                  Text(
                    DateTime.now().hour < 12 ? 'GOOD MORNING! ' : DateTime.now().hour < 16 ? 'GOOD AFTERNOON!' : 'GOOD EVENING!',
                    style: const TextStyle(
                      fontFamily: "Ethnocentric",
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text("${user?.displayName}",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  )
                ],
              ),
            ),

            // App Shortcut
            Container(
              margin: const EdgeInsets.only(top: 7),
              height: 290,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: dashboardM.length,
                  itemBuilder: (ctx, index) {
                    dashboardModel1 current = dashboardM[index];
                    return Container(
                        height: 290,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                                   ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                      child: Image(image:AssetImage(current.imageUrl),fit: BoxFit.fitHeight),
                                  ),
                            ],
                          ),
                        ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(24),
              child: GridB(),
            )
          ],
        ),
      ),

      );
  }
}
