import 'package:flutter/cupertino.dart';
import 'package:gymoto/src/features/screens/login_and_singup/login.dart';
import 'package:gymoto/src/features/screens/login_and_singup/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage =true;

  void toggleScreens()
  {
    setState(()
        {
          showLoginPage =!showLoginPage;
        });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage)
      {
        return MyLogin(showRegisterPage: toggleScreens);
      }
    else
      {
        return MyRegister(showloginPage: toggleScreens);
      }
  }
}
