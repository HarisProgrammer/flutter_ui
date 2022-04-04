import 'package:blog_app/views/login_page.dart';
import 'package:blog_app/views/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({Key? key}) : super(key: key);

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {

  final _formKey = GlobalKey<FormState>();

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
                              "FORGOT PASSWORD",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 25,
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
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 10),
                 child: Text("After Entering an Email a Reset password link will be send to Your Email Click on that Link",style: TextStyle(color:Colors.green,fontSize: 14,fontWeight: FontWeight.bold),),
               ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipPath(
                    clipper: RoundedDiagonalPathClipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.width * 0.9,
                      decoration:BoxDecoration(
                        color: const Color(0xff252c4a),
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
                                decoration: const InputDecoration(
                                  hintText: "Enter Valid Email",
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
                                    onPressed: () {},
                                    child:const Text("Send Email",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)
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
