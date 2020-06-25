import 'package:LoginSignup/Activities/authenticate/SignUp.dart';
import 'package:LoginSignup/Activities/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn =! showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SigningIn(toggleView: toggleView);
    }else{
      return SignUp(toggleView: toggleView);
    }
  }
}