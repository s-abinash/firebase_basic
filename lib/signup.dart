import 'package:flutter/material.dart';
import 'package:student/models/auth.dart';


class Signup extends StatefulWidget {

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {


    String name='';
    String rollno='';
    String phone='';
    String error='ok';
    String department='';
    String email;
    String password;
    String repassword;
    String currentyear;


    final AuthService _auth = AuthService();
    final _formKey = GlobalKey<FormState>();

  alert()
  {

          return showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Registeration Failed",
                             style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25.0 
                                ),),
                content: new Text("Try giving valid credientials"),
                actions: <Widget>[

                  // usually buttons at the bottom of the dialog
                  Center(
                    child: new FlatButton(
                      child: new Text("OK", style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15.0 
                                  )),
                      onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ),
          ],
        );
      },
    );


  }

sucessalert(){


    return showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: new Text("Register Successfully",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 25.0 
                                ),
                                    ),
                content: new Text("You can login now!"),
                actions: <Widget>[
                
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("LOGIN", style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.0 
                                )),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signin');
              },
            ),
          ],
        );
      },
    );
  }
 signup()async{

   if(_formKey.currentState.validate())
    {
       _formKey.currentState.save();
       try{

           if(name.isNotEmpty  && rollno.isNotEmpty && department.isNotEmpty && currentyear.isNotEmpty && phone.isNotEmpty)
            {
                 dynamic result=  await _auth.registerWithEmailAndPassword(email, password, rollno,name,department,currentyear,phone);
                print("HERE THE SIGNUP UID");
                print(result);
               print("sssssssss $result");

            if(result==null)
            { 
               alert();
            }else
            {
            if(error=='ok')
              {
                     sucessalert();
                     return await _auth.signOut();
              }
              
               //sucessalert();
            }
         }
      }
       catch(e)
       {
          print("effffffffffffffff");
           print(e);
       }
    }
     

  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      

          theme: ThemeData(
            primaryColor: Colors.black
            
          ),
          home: Scaffold(
            
        
        // appBar: AppBar(
        //   title: Text('Login'),
        //   backgroundColor: Colors.black,
        // ),
        
        body: Center(
              child: Container(
                  
            decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage('images/bg.jpg'),
                    fit: BoxFit.cover,
                    // gradient: LinearGradient(
                    //   begin: Alignment.bottomLeft,

                    //   end: Alignment.topRight,
                    //   colors: [Colors.greenAccent, Colors.blue])
                    )),
            child: Center(
                    child: SingleChildScrollView(
                         child: Padding(
                        padding: EdgeInsets.fromLTRB(20,30, 20, 0),
                        child: Card(
                          margin: EdgeInsets.fromLTRB(0, 30, 0, 25),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: Form(
                    key: _formKey,
                          child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
              padding: EdgeInsets.fromLTRB(50, 80, 60, 40),
            child: Image.asset(
                  'images/kec.png',
                  width: 70.0,
                  height: 100.0,
                  fit: BoxFit.cover,
              ),
          ),
          
        Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 5),
                    child: TextFormField(
                   decoration: new InputDecoration(
                           contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              labelText: " Email",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.length==0 ) {
                          return "Enter a mail id id ";
                        }else{
                          if(!val.contains('@'))
                          {
                              return "Enter a valid mail";
                          }else{
                          return null;
                          } 
                        }
                      },
                      onChanged: (val)=>email=val,
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                        ),
                      ),
                       Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                       child: TextFormField(
                      decoration: new InputDecoration(
                           contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        labelText: " Password",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ), obscureText: true,
                      validator: (pass) {
                        if(pass.length<8) {
                          return "password must be above 8 char";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (pass){setState(() {
                        password=pass;
                      });},
                     // keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                           ),
                      ),
                      ),
                      
                 Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                       child: TextFormField(
                      decoration: new InputDecoration(
                           contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        labelText: " Retype Password",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ), obscureText: true,
                      validator: (pass) {
                          //print(password);
                        if(password!=pass)
                         {
                          return "Password should be same !";
                        }
                        else{
                          return null;
                        }
                      },
                      onChanged: (pass)=>repassword=pass,
                    //  keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                      ),
                     ),
               Padding(
                        padding: EdgeInsets.fromLTRB(25, 20, 25, 5),
                        child: TextFormField(
                        decoration: new InputDecoration(
                           contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                         labelText: " Name",
                         fillColor: Colors.white,
                         border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if(val.isEmpty) {
                          return "Enter a Name ";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (val)=>name=val,
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                       ),
                      ),
                     ),
               Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                       child: TextFormField(
                      decoration: new InputDecoration(
                           contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        labelText: " Roll Number",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      //obscureText: true,
                      validator: (pass) {
                        if(pass.length!=8) {
                          return "Enter valid Rollno";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (pass)=>rollno=pass,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
          ),
          ),
          
          Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                       child: TextFormField(
                      decoration: new InputDecoration(
                           contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        labelText: " Department",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                     //p obscureText: true,
                      validator: (pass) {
                        if(pass.length>5) {
                          return "Eg. CSE,MECH";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (pass)=>department=pass,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
          ),
          ),
          Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
                       child: TextFormField(
                      decoration: new InputDecoration(
                           contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        labelText: " Current Year",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: false,
                      validator: (pass) {
                        if(pass.length!=1) {
                          return "enter current year";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (pass)=>currentyear=pass,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
          ),
          ),

          Padding(
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 5),
                    child: TextFormField(
                   decoration: new InputDecoration(
                           contentPadding: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              labelText: " Phone",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      keyboardType: TextInputType.number,
                    validator: (val) {
                        if(val.length!=10 ) {
                          return "Enter a valid mobile number ";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (val)=>phone=val,
                     // keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
              ),
                 ),
           Container(
                        
                        width: 250,
                        padding: EdgeInsets.fromLTRB(20, 40, 20, 30),
                        child: FlatButton(
                          
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                         child: Text('Register'),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: signup
                          ,
              ),
          ),
          
            Divider(
                 color: Colors.black,
            
         ), 
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context, '/main');
                      },
                      child: Text("Already hava a Account?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,

                            ),
                            ),
                          ),
                      )
                      ],)
                       ),
                        ),
                      ),
                    )
              ),
          ))),
    );
  }
}