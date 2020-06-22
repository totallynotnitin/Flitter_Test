import 'package:LoginSignup/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:LoginSignup/Activities/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:LoginSignup/models/user.dart';

void main() =>runApp(MyApp());
  

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          home: Wrapper(),
      ),
    );
}
}