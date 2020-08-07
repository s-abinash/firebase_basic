import 'package:student/models/User.dart';
import 'package:student/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student/signin.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print('+++THE USER STATUS = $user');
    
    
    // return either the Home or Authenticate widget
    if(user==null)
    {
      return Signin();

    }
    else{

      return Home();
    }
    
  }
}