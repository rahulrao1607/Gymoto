import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gymoto/src/Yoga%20and%20excercise/Yogafeatures/home/yView/yoga_home.dart';
import 'package:gymoto/src/profile/profile_page.dart';
import 'package:provider/provider.dart';

import '../../../state mangment/Ycontroller/sytate_controller.dart';
import '../../today/todayyogaView/today_screen.dart';

class DashBoard extends StatefulWidget {
  static const id = "/dash?=1";
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final screens = <Widget>[
    const TodayScreen(),
    const HomeScreen(),
  ];




  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(
      builder: (_, sCont, __) =>
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            body: IndexedStack(
              index: sCont.currentIndex,
              children: screens,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xFFf5ceb8),
              elevation: 0,
              shape: const CircleBorder(),
              child: FaIcon(
                FontAwesomeIcons.dumbbell,
                color: sCont.currentIndex == 1 ? Colors.orange : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  sCont.changeIndex(1);
                  FocusManager.instance.primaryFocus?.unfocus();
                });
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: SizedBox(
              height: 60,
              child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          sCont.changeIndex(0);
                          FocusManager.instance.primaryFocus?.unfocus();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.calendar,
                              color: sCont.currentIndex == 0 ? Colors.orange : Colors.black,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Today',
                              style: TextStyle(
                                color: sCont.currentIndex == 0 ? Colors.orange : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          sCont.changeIndex(2);
                          FocusManager.instance.primaryFocus?.unfocus();
                        });
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const MyProfile(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.gears,
                              color: sCont.currentIndex == 2 ? Colors.orange : Colors.black,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Settings',
                              style: TextStyle(
                                  color: sCont.currentIndex == 2 ? Colors.orange : Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
