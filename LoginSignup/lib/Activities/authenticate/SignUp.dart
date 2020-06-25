import 'package:flutter/material.dart';
import 'package:LoginSignup/Services/auth.dart';
import 'package:LoginSignup/Shared/constants.dart';
import 'package:LoginSignup/Shared/loading.dart';

class SignUp extends StatefulWidget {
  final Function toggleView;
  SignUp({ this.toggleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
final _formkey = GlobalKey<FormState>();
bool loading = false;
  //text field
  String email = '';
  String pass = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              
              key: _formkey,
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Stack(
                      children: <Widget>[
                        /*Container(
                          padding: EdgeInsets.fromLTRB(15.0, 75.0, 0.0, 0.0),
                          child: Text(
                            'Hello',
                            style: TextStyle(
                                fontSize: 60.0, fontWeight: FontWeight.bold),
                          ),
                        ),*/
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 125.0, 0.0, 0.0),
                          child: Text(
                            'Signup',
                            style: TextStyle(
                                fontSize: 60.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(200.0, 125.0, 0.0, 0.0),
                          child: Text(
                            '.',
                            style: TextStyle(
                                fontSize: 60.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding:
                        EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                            decoration:
                                textInputDeco.copyWith(labelText: 'Email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            }),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              textInputDeco.copyWith(labelText: 'Password'),
                          obscureText: true,
                          validator: (val) =>
                              val.length < 6 ? 'Minimum 6 characters' : null,
                          onChanged: (val) {
                            setState(() => pass = val);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ),
                  SizedBox(height: 0.0),
                  /*Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.only(left: 190.0),
                    child: InkWell(
                      child: Text(
                        'Forgot password',
                        style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ),*/
                  SizedBox(height: 20.0),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                      width: 300.0,
                      height: 50.0,
                      child: FlatButton(
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          child: Text('Signup'),
                          textColor: Colors.white,
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.regwemailpass(email, pass);
                              if (result == null) {
                                setState(() {
                                  error = 'Email or password is wrong';
                                  loading = false;
                                });
                              }
                            }
                          }),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  /*Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    padding: EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                      width: 300.0,
                      height: 50.0,
                      child: FlatButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                            side: BorderSide(color: Colors.black),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child:
                                    ImageIcon(AssetImage('assets/fbicon.png')),
                              ),
                              SizedBox(width: 20.0),
                              Center(
                                child: Text(
                                  'Register with Facebook',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'RobotoMono'),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {}),
                    ),
                  ),*/
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Already a member?',
                        style: TextStyle(fontFamily: 'RobotoMono'),
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text('Sign In',
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
