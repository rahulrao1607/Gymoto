import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../main_wrapper.dart';

class ShoppingSplash extends StatefulWidget {
  const ShoppingSplash({Key? key}) : super(key: key);

  @override
  State<ShoppingSplash> createState() => _ShoppingSplashState();
}

class _ShoppingSplashState extends State<ShoppingSplash> {
  @override
  void initState()
  {
    super.initState();

    Future.delayed(const Duration(seconds: 4)).then((value){
      Navigator.of(context).push(
          CupertinoPageRoute(builder: (ctx) => const MainWrapper()));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Image(
              image: AssetImage("assets/images/gymlogo.png"),
              height:500,
              width: 300,
            ),
            SizedBox(
              height:90,
            ),
            SpinKitSpinningLines(
              color: Colors.black,
              size: 100,
            )
          ],
        ),
      ),
    );
  }
}
