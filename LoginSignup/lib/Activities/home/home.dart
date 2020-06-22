import 'package:LoginSignup/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: Text('Login Test'),backgroundColor: Colors.green[400],
        elevation: 1.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: ()async{
              await _auth.signOut();
              
            },
            )
        ],

      ),

    );
    
  }
}