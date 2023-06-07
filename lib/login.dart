import 'package:eride/Admin/Admin.dart';
import 'package:eride/driver/Driverhome.dart';
import 'package:eride/singup1.dart';
import 'package:eride/taxi/Taxihome.dart';
import 'package:eride/user/homepage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  String user="user";
  String driver="driver";
  String taxi="taxi";
  String admin="admin";

  TextEditingController passcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

appBar: AppBar(
  // Overide the default Back button
  automaticallyImplyLeading: false,
  leadingWidth: 100,
  leading: ElevatedButton.icon(
    onPressed: () => Navigator.of(context).pop(),
    icon: const Icon(Icons.arrow_left_sharp,color: Colors.green,),
    label: const Text('Back',style: TextStyle(color:Colors.green )),
    style: ElevatedButton.styleFrom(

      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

  ),
  backgroundColor: Colors.transparent,
  elevation: 0,
  // other stuff

),

      body:


      SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 20.0),
              child: Container(
                height: 250,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/banner.png"),fit: BoxFit.cover),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Login",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("welcom back Login with your details",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0,right: 50,top: 10,bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Enter Username",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50.0,
                right: 50.0,
              ),
              child: TextField(
controller: passcontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: "Enter password",
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(

              height: 20,),

          Container(
            width: 310,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if(passcontroller.text == user){

                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homeuser()));
                  }
                  else if(passcontroller.text == driver){Navigator.push(context, MaterialPageRoute(builder: (context)=>Driverhome()));
    }
                  else if(passcontroller.text == taxi){Navigator.push(context, MaterialPageRoute(builder: (context)=>Taxihome()));
                  }
                  else if(passcontroller.text == admin){Navigator.push(context, MaterialPageRoute(builder: (context)=>Admin()));
                  }
                },

                child: Text("login")
            ),
          ),
            Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(
                            color: Colors.green, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(text: ' Sign up',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 18,fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Singup1()));
    }

                          )
                        ]
                    ),
                  ),
                )
            )

          ],
        ),
      ),
    );
  }
}
