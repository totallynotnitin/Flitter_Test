
import 'package:LoginSignup/Shared/constants.dart';
import 'package:LoginSignup/Shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:LoginSignup/Services/auth.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView});
  @override

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

final AuthService _auth = AuthService();
final _formkey = GlobalKey<FormState>();
bool loading = false;
  //text field
  String email = '';
  String pass = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold(

      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[600],

        elevation: 1.0,
        title: Text('SignUp in to whateverThisIs'),
        actions: <Widget>[
          FlatButton.icon(onPressed: () {widget.toggleView();}, icon: Icon(Icons.person), label: Text('SignIn'))
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
                
                validator: (val) =>val.length < 6 ? 'Password minimum length 6' :null,
                decoration: textInputDeco.copyWith(hintText: 'password'),
                obscureText: true,
                onChanged: (val){
                  setState(() => pass = val);
                },
              ),

              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.brown[400],
                child: Text('Register',
                style: TextStyle(color: Colors.white),
                ),
                
                
                
                
                onPressed: () async {
                  if (_formkey.currentState.validate()){
                    setState(() =>loading = true);
                    dynamic result = await _auth.regwemailpass(email, pass);
                    if (result == null) {
                      setState(() { error = 'please supply a valid email';
                      loading = false;}
                      ); 
                       
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