import 'package:blog_app/views/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  var name = "";
  var email = "";
  var password = "";



  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  reset() async{
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }


  register() async{

    if(name.isEmpty){
       Fluttertoast.showToast(msg: "Name is Required");
      return null;
    }

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
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email:email,
          password:password
      );
      Fluttertoast.showToast(msg: "User is Registered");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: "Password is weak");
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: "Already Exists");
      }
    } catch (e) {
      print(e);
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
                          padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "REGISTER HERE",
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
                            height: 110,
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
                                style: TextStyle(color: Colors.white),
                                controller: nameController,
                                decoration: const InputDecoration(
                                  hintText: "Enter Name",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon:
                                      Icon(Icons.person, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
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
                                style: TextStyle(color: Colors.white),
                                controller: emailController,
                                decoration: const InputDecoration(
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
                            height: 20,
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
                                style: TextStyle(color: Colors.white),
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
                                        name = nameController.text.trim();
                                        email = emailController.text.trim();
                                        password = passwordController.text.trim();
                                      });
                                      register();
                                      reset();

                                    }

                                    },
                                    child:const Text("Sign up",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
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
        const Text("Already Have an Account ?"),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginPage()));
          },
          child: const Text("Login",style: TextStyle(color: Colors.deepOrange,fontSize: 18),
          ),
        )
      ],
    );

  }
}
