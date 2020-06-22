import 'package:LoginSignup/Services/auth.dart';
import 'package:LoginSignup/Shared/constants.dart';
import 'package:LoginSignup/Shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading= false;
  //text field
  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(

      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[600],

        elevation: 1.0,
        title: Text('Sign in to whateverThisIs'),
        actions: <Widget>[
          FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person), label: Text('Register'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formkey,
          child:Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDeco.copyWith(hintText: 'Email'),
                validator: (val) =>val.isEmpty ? 'Enter an email' :null,
                onChanged: (val) {
                  setState(() => email = val);
                }
              ),

              SizedBox(height: 20.0),
              TextFormField(
                
                validator: (val) =>val.length < 6 ? 'Enter complete password' :null,
                decoration: textInputDeco.copyWith(hintText: 'Password'),
                obscureText: true,
                onChanged: (val){
                  setState(() => pass = val);
                },
              ),

              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.brown[400],
                child: Text('sign in',
                style: TextStyle(color: Colors.white),
                ),
                
                
                
                
                onPressed: () async {
                  if (_formkey.currentState.validate()){
                    setState(() {
                      loading =true;
                    });
                    dynamic result = await _auth.signwemailpass(email, pass);
                    if (result == null) {
                      setState(() {
                        error = 'Email or password is wrong';
                        loading=false;
                      });
                    }
                  }
                }
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          
        ),
      ),
    ),
    );
  }
}