import 'package:blog_app/views/forgot_page.dart';
import 'package:blog_app/views/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  var email = "";
  var password = "";



  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  reset() async{
    emailController.clear();
    passwordController.clear();
  }


  login() async{


    if(email.isEmpty){
      Fluttertoast.showToast(msg: "Email is Required");
      return null;
    }

    if(!email.contains('@')){
      Fluttertoast.showToast(msg: "Enter valid email");
      return null;
    }

    if(password.isEmpty){
      Fluttertoast.showToast(msg: "Password is Required");
      return null;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "User Not Found");
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Incorrect Password");
      }
    }




  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipPath(
                      clipper: WaveClipperOne(),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: MediaQuery.of(context).size.width * .5,
                        decoration: const BoxDecoration(color: Color(0xff252c4a)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "LOGIN HERE",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipPath(
                    clipper: RoundedDiagonalPathClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.width * 1.1,
                      decoration:BoxDecoration(
                        color: Color(0xff252c4a),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 120,
                          ),
                          Container(
                            width: 320,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blueAccent),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                controller:emailController,
                                decoration:const InputDecoration(
                                  hintText: "Enter Email",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon:
                                  Icon(Icons.email, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 320,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blueAccent)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: "Enter Password",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon:
                                  Icon(Icons.lock, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ForgotPage()));
                                  },
                                  child: Text("Forgot Password ?",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontSize: 18)
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width:200,
                                height: 40,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.deepOrange
                                    ),
                                    onPressed: () {
                                      if(_formKey.currentState!.validate()){

                                        setState(() {
                                          email = emailController.text.trim();
                                          password = passwordController.text.trim();
                                        });
                                        login();
                                        reset();

                                      }
                                    },
                                    child:const Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
                                ),
                              )
                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                rowUsable(context)
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget rowUsable(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        const Text("Dont Have an Account ?"),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterPage()));
          },
          child: const Text("Register",style: TextStyle(color: Colors.deepOrange,fontSize: 18),
          ),
        )
      ],
    );

  }
}
