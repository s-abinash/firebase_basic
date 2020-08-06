import 'package:flutter/material.dart';
import 'package:student/models/auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class Signin extends StatefulWidget {

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {

    bool load=false;
    String error='login';
    String email;
    String password;
    final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


   signin()async{

   if(_formKey.currentState.validate())
    {
       _formKey.currentState.save();
       try{

            setState(() {

                    load=true;

                });

            dynamic result=await _auth.signInWithEmailAndPassword(email, password);
              print("*/*/*/*/*/*/*/*/*//");
            print(result);
            if(result==null)
            {
                 setState(() {

                    load=false;

                    });
                   
                
               return  showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Login Failed", style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25.0 
                                ),),
                content: new Text("Invalid credientials"),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text("OK", style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.0 
                                ),),
                    onPressed: () {
                Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

            }else
            {
                

              print('sucess');
               setState(() {
                load=true;
                error='succss';
                 Navigator.pushReplacementNamed(context, '/main');
              });
              
                

            }

       }catch(e)
       {
         print(e.toString());
       }
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      

          theme: ThemeData(
            primaryColor: Colors.black
            
          ),
          home: load?Scaffold(

            body: Container(
                  
            decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage('images/bg.jpg'),
                    fit: BoxFit.cover,
                    // gradient: LinearGradient(
                    //   begin: Alignment.bottomLeft,

                    //   end: Alignment.topRight,
                    //   colors: [Colors.greenAccent, Colors.blue])
                    )),
                  child:SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
               return DecoratedBox(
            decoration: BoxDecoration(
                color: index.isOdd ? Colors.white : Colors.white,
      ),
    );
  },
),
              )


          ):Scaffold(
            
        
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
                        if(val.length<=5 && !val.contains('@')) {
                          return "Enter a valid mail ";
                        }else{
                          return null;
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
                      ),obscureText: true,
                      validator: (pass) {
                        if(pass.length<8) {
                          return "password must be above 8 char";
                        }else{
                          return null;
                        }
                      },
                      onChanged: (pass)=>password=pass,
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
          ),
          ),

              
           Container(
                        
                        width: 250,
                        padding: EdgeInsets.fromLTRB(20, 40, 20, 30),
                        child: load?FlatButton.icon(
                          
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                          icon:Icon(Icons.loop,color: Colors.black,),
                          label: Text("loading"),
                          color: Colors.green,
                          textColor: Colors.white,
                           onPressed: (){},
                        ):FlatButton(
                          
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
                         child: Text('Login'),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: signin,
              ),
          ),
          
            Divider(
                 color: Colors.black,
            
         ), 
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Text("Create an Account?",
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