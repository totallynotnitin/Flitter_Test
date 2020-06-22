import 'package:LoginSignup/Activities/authenticate/authenticate.dart';
import 'package:LoginSignup/Activities/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:LoginSignup/models/user.dart';

class Wrapper extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
  //login state recieve from the provider as 'User' value
   final user = Provider.of<User>(context);
   print(user);
   //auth or home redirect
   if(user == null){
      return Authenticate();
   }else{
      return Home();
   }
    
  }
}