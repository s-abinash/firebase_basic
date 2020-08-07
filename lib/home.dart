import 'package:flutter/material.dart';
import 'package:student/models/att.dart';
import 'package:student/models/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student/models/home_card.dart';
import 'package:student/models/setting.dart';




class Home extends StatefulWidget {
   Home() : super();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> 
with SingleTickerProviderStateMixin{

  //final stu=Provider.of<QuerySnapshot>(context);
 // DatabaseReference _databaseReference =FirebaseDatabase.instance.reference();
 
  TabController controller;
    
  @override
  void initState() {
    super.initState();
    controller = TabController(length:3 , vsync: this);
  }
 
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     
    return StreamProvider<QuerySnapshot>.value(
      value:  DatabaseService().student,
      
      child: Scaffold(
      
          // floatingActionButton: FloatingActionButton(
          // onPressed: ()async{
          //    dynamic result=await _auth.signOut();
          //   Navigator.pushReplacementNamed(context, '/main');

          // },
          // child:Icon(Icons.exit_to_app)
          // ),


          
      body: TabBarView(
        children: <Widget>[
          Home_Card(),
          Att(),
          Setting(),
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.black,
        
        child: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.calendar_today),
            ),
            Tab(
              icon: Icon(Icons.settings),
            ),
          ],
          controller: controller,
        ),
      ),
     )
    );
  }
}