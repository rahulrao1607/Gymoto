import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class MyRegister extends StatefulWidget {
  final VoidCallback showloginPage;
  const MyRegister({Key? key,required this.showloginPage}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {

  final datafb = FirebaseDatabase.instance;
  final _emailController  = TextEditingController();
  final _displayName = TextEditingController();
  final _passwordController = TextEditingController();
  final _phnController = TextEditingController();
  final _cnfpasswordController = TextEditingController();


  Future signUp() async{
    if(passwordConfirmed())
      {
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        //add user details
        addUserDetails(
          _displayName.text.trim(),
          _phnController.text.trim(),
          _emailController.text.trim(),

        );
      }
  }


  Future addUserDetails(String name,String phone,String email) async{
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).
    set({
      'id' :FirebaseAuth.instance.currentUser!.uid,
      'name':name,
      'phone':phone,
      'email':email,
      'profilePhoto': null,
    });

  }

  bool passwordConfirmed()
  {
    if(_passwordController.text.trim()== _cnfpasswordController.text.trim())
      {
        return true;
      }
    else
      {
        return false;
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464646),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create \n Account',
                style: TextStyle(color: Colors.white, fontSize: 33.0),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 60),
                child: TextFormField(
                  controller: _displayName,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Name cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                      hintText: "Name",
                      prefixIcon: const Icon(Icons.person),
                      hintStyle: const TextStyle(color: Colors.black),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _phnController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Phone Number cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                      hintText: "Phone Number",
                      prefixIcon: const Icon(Icons.phone),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Email cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Password cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.password),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: _cnfpasswordController,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Confirm Password cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                        ),
                      ),
                      hintText: " Confirm Password",
                      prefixIcon: const Icon(Icons.password),
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: signUp,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color(0xFF464646),
                    borderRadius: BorderRadius.circular(22),
                  ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),

                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: widget.showloginPage,
                child: Container(
                  //margin: EdgeInsets.symmetric(vertical: 30),
                 alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF464646),
                    borderRadius: BorderRadius.circular(22),
                  ),
                    child: const Text(
                      'Already have a account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                ),
              ),
            ],
          ),
        ),

      ),

    );
  }
}

