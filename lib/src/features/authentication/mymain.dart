import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymoto/src/features/screens/welcome/dashboard_screen.dart';

import 'myauth.dart';

class Mymain extends StatelessWidget {
  const Mymain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
          {
            return DasBoard();
          }
          else
            {
              return AuthPage();
            }

        },
      ),
    );
  }
}
