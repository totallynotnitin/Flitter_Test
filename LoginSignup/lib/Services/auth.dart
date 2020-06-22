import 'package:LoginSignup/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Create a user obj on firebaseUser
  User _userFromFirebase(FirebaseUser user){
    return user != null?User(uid: user.uid) : null;
  } 
  //change user stream from firebaseuser
  Stream<User> get user{
    return _auth.onAuthStateChanged
    .map(_userFromFirebase);
  }
  //sign in with anon
  Future signInAnon() async {
      try{
        AuthResult result = await _auth.signInAnonymously();
        FirebaseUser user = result.user;
        return _userFromFirebase(user);
      }catch(e){
          print(e.toString());
          return null;
      }
  }
  //sign in with email and password
  Future signwemailpass(String email,String pass) async {
    try{
        AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
        FirebaseUser user = result.user;
        return _userFromFirebase(user);


    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //Register with email and password
    Future regwemailpass(String email,String pass) async {
    try{
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
        FirebaseUser user = result.user;
        return _userFromFirebase(user);


    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //signout
  Future signOut() async {
    try{
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}