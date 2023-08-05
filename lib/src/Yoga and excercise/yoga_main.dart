import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymoto/src/Yoga%20and%20excercise/state%20mangment/Ycontroller/rive_controller.dart';
import 'package:gymoto/src/Yoga%20and%20excercise/state%20mangment/Ycontroller/sytate_controller.dart';
import 'package:gymoto/src/Yoga%20and%20excercise/state%20mangment/Ycontroller/yoga_controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/screens/splash_screen/splash_screen.dart';
import 'Ymodels/ysession.dart';
import 'Yogafeatures/home/yView/yoga_dashboard.dart';
import 'Yogafeatures/settings/ysetView/theme_selection_screen.dart';
import 'Yogafeatures/today/todayyogaView/notification screen.dart';
import 'Yogafeatures/yoga/yoga_view/are_you_ready.dart';
import 'Yogafeatures/yoga/yoga_view/break.dart';
import 'Yogafeatures/yoga/yoga_view/finish.dart';
import 'Yogafeatures/yoga/yoga_view/product_page.dart';
import 'Yogafeatures/yoga/yoga_view/workoutyoga.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => StateController()),
      ChangeNotifierProvider(create: (_) => RiveController()),
      ChangeNotifierProvider(create: (_) => YogaController()),
    ], child: MyApp2(prefs: prefs)),
  );
}

class MyApp2 extends StatefulWidget {
  const MyApp2({super.key, required this.prefs});
  final SharedPreferences prefs;

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
  void didChangeDependencies() {
     super.didChangeDependencies();
     StateController stateController = Provider.of<StateController>(context, listen: false);
     if (stateController.prefs == null) {
       Provider.of<StateController>(context, listen: false).initPrefs(widget.prefs);
     }
     if (Provider.of<RiveController>(context, listen: false).prefs == null) {
       Provider.of<RiveController>(context, listen: false).initPrefs(widget.prefs);
     }
     Provider.of<RiveController>(context, listen: false).getAnimation();
     YogaController yogaController = Provider.of<YogaController>(context, listen: false);
     yogaController.getDoneWorkout();
     for (int i = 0; i < 6; i++) {
       yogaController.addSession(Session(title: "Session ${i + 1}", idx: i));
     }
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
       await stateController.getImgBytes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<StateController>(context).themeMode,
      theme: ThemeData(
        fontFamily: 'Avenir',
        scaffoldBackgroundColor: const Color(0xfff8f8f8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        fontFamily: 'Avenir',
        scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        textTheme: ThemeData.dark().textTheme,
        dividerTheme: ThemeData.dark().dividerTheme,
        bottomAppBarTheme: ThemeData.dark().bottomAppBarTheme,
        bottomNavigationBarTheme: ThemeData.dark().bottomNavigationBarTheme,
        appBarTheme: ThemeData.dark().appBarTheme,
        dialogTheme: ThemeData.dark().dialogTheme,
      ),
      home: const SplashScreen(),
      routes: {
        ProductPage.id: (_) => const ProductPage(),
        DashBoard.id: (_) => const DashBoard(),
        ThemeSelectionScreen.id: (_) => const ThemeSelectionScreen(),
        AreYouReadyScreen.id: (_) => const AreYouReadyScreen(),
        NotificationScreen.id: (_) => const NotificationScreen(),
        WorkoutScreen.id: (_) => const WorkoutScreen(),
        BreakTime.id: (_) => const BreakTime(),
        Finish.id: (_) => const Finish(),
      },
    );
  }
}
