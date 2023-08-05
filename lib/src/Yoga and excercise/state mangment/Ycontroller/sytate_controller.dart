import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image/image.dart' as image_pkg;
import '../../Yutils/yconstant.dart';


class StateController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  Uint8List? imgBytes;

  int _currentIndex = 1;
  int _previousIndex = 1;

  int get currentIndex => _currentIndex;
  int get previousIndex => _previousIndex;

  SharedPreferences? prefs;


  Future<void> getImgBytes() async {
    final bytes = await rootBundle.load("assets/yoga.png");
    Uint8List imgBytes = bytes.buffer.asUint8List();
    this.imgBytes = _manipulateImage(imgBytes);
  }

  Uint8List _manipulateImage(Uint8List imgData) {
    final img = image_pkg.readPng(imgData)!;
    image_pkg.drawString(
      img,
      image_pkg.arial_48,
      100,
      200,
      'You got this',
      color: image_pkg.getColor(255, 0, 255),
    );
    return Uint8List.fromList(image_pkg.encodePng(img));
  }


  void changeTheme(ThemeMode theme) async{
    _themeMode = theme;
    notifyListeners();
  }

  void initPrefs(SharedPreferences prefs) {
    this.prefs = prefs;
  }


  void changeIndex(int idx) {
    _previousIndex = _currentIndex;
    _currentIndex = idx;
    notifyListeners();
  }

}