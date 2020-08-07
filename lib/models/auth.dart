import 'package:student/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student/models/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFromFirebaseUser(user));
      .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }




  // sign in with email and password
Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    } 
  }


  // register with email and password
  Future registerWithEmailAndPassword(String email,String password,String rollno ,String name,String department,String currentyear,String phone)async{

  try{

    AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user =result.user;
    await DatabaseService(uid: user.uid).updateUserData(rollno,name,department,currentyear,email,password,phone);
    return _userFromFirebaseUser(user);

  }catch(e)
  {
      print(e.toString());
      return null;
  }


  }

  // sign out

  Future signOut() async{
    try{
        return await _auth.signOut();


    }
    catch(e)
    {
      print(e.toString());
      return null;
    }


  }

//current user

    getCurrentUser() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    // Similarly we can get email as well
    //final uemail = user.email;
    print(uid);
    //print(uemail);
  }


} 