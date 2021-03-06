import 'package:LoginSignup/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  
final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Welcome'),backgroundColor: Colors.green,
        elevation: 2.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout',style: TextStyle(color: Colors.black) ),
            onPressed: ()async{
              await _auth.signOut();
              
            },
            )
        ],

      ),

    );
    
  }
}