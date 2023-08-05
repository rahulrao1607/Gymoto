import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gymoto/src/features/authentication/mymain.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  @override

  void initState()
  {
    super.initState();

    Future.delayed(const Duration(seconds: 4)).then((value){
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx) => const Mymain()));

    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(68, 68, 68, 36),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const[
              Image(
                  image: AssetImage("assets/images/logon.png"),
                height:500,
                width: 300,
              ),
              SizedBox(
                height:90,
              ),
              SpinKitSpinningLines(
                color: Colors.white,
                size: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
