import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyLogin extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const MyLogin({Key? key,required this.showRegisterPage}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

 final _emailContoller = TextEditingController();
 final _passwordController = TextEditingController();

 Future signIn() async{
   await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: _emailContoller.text.trim(),
       password: _passwordController.text.trim(),
   );
 }
 @override
  void dispose() {
    // TODO: implement dispose
   _emailContoller.dispose();
   _passwordController.dispose();
   super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/login.png"), fit: BoxFit.cover),
      ),
      child: Scaffold(
         resizeToAvoidBottomInset: false,
         backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 250),
              child: RichText(text: const TextSpan(
                text:"Hello,",
                style: TextStyle(color: Colors.white,
                    fontSize: 70,
                  fontWeight: FontWeight.bold,),
                children: [
                  TextSpan(
                    text:"\nSign into your account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:18,
                    )
                  )
                ],
              ),
            ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailContoller,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email,color: Colors.black),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            style: TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Password",
                                prefixIcon: Icon(Icons.email,color: Colors.black,),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap: signIn,
                              child: Container(
                                 margin: EdgeInsets.symmetric(horizontal: 30),
                                 padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Center(
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),

                            ),

                          ),
                       SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: widget.showRegisterPage,
                                child: Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white,
                                        fontSize: 22),
                                  ),
                                ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


