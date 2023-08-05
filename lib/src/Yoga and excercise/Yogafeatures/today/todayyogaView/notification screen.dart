import 'package:flutter/material.dart';
import '../../../Yutils/ycolors.dart';

class NotificationScreen extends StatelessWidget {
  static const id = "/notifications?bool=false";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colours.peachColour,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage("assets/notification.png"),
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
                        BlendMode.dstATop,
                      )
                  )
              ),
            ),
            const Text(
              "No Notifications",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
