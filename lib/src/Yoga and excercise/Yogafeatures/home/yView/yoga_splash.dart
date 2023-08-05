import 'package:flutter/material.dart';
import 'package:gymoto/src/Yoga%20and%20excercise/Yogafeatures/home/yView/yoga_dashboard.dart';
import '../../today/todayService/localdatabase.dart';


class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {


  checkUp() async{
    await LocalDB.getFirstTime().then((value) async {

      if(value.toString() == "null" || value != false) {
        print("First Time Entering");
        await LocalDB.setStreak(0);
        await LocalDB.setLastDoneOn(DateTime.now().subtract(const Duration(days:1)).toString());
        await LocalDB.setKCal(0);
        await LocalDB.setWorkOutTime(0);
        await LocalDB.setFirstTime(false);

        // CREATING ONE YOGA WORKOUT PACK
/*
        makeYogaSumEntry(YogaSummary(YogaWorkOutName: YogaModel.YogaTable1, BackImg: "assets/01_Suryanamskar/main.jpg", TimeTaken: "6", TotalNoOfWork: "12", yogakey: 1));
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/1.png", YogaTitle: "Pranamasana (Prayer pose)", SecondsOrTimes: '15', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/2.png", YogaTitle: "Hastauttanasana (Raised arms pose)", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/3.png", YogaTitle: "Uttanasana (Standing forward bend)", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/4.png", YogaTitle: "Ardha Uttanasana (half-standing forward bend)", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/5.png", YogaTitle: "Exhale and return to the forward fold", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/6.png", YogaTitle: "Get into a plank pose", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/1.png", YogaTitle: "Lower yourself into a low pushup", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/2.png", YogaTitle: "Urdhva Mukha Svanasana(Inhale and enter an upward dog pose)", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/3.png", YogaTitle: "Adho Mukha Svanasana (downward dog pose)", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/4.png", YogaTitle: "Move back into the standing forward bend", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/5.png", YogaTitle: "Inhale and move back into the upward salute", SecondsOrTimes: '30', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
        makeYogaEntry(Yoga(Seconds: true, YogaImgUrl: "assets/01_Suryanamskar/6.png", YogaTitle: "Exhale and return to the mountain pose", SecondsOrTimes: '15', YogaKey_WorkOuts: 1), YogaModel.YogaTable1, );
*/



      }
    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUp();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context,DashBoard.id);
    });
    //CHECK INSTALLATION,INSERT,READ,UPDATE,OPERATION STATUS

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset("assets/logo/yoga_trasparent.png")
      ),
    );
  }
}
