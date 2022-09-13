import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _useremail;

  void _register()async{
    final User? user = (
    await _auth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text)
    ).user;

    if(user != null){
      setState(() {
        _success = true;
        _useremail = user.email!;
      });
    }
    else{
      setState(() {
        _success = false;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
            child: const Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only( top: 35, left: 20, right: 30),
              child: Column(
                children:  <Widget>[
                   TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green),
                        )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green),
                        )
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Container(
                    alignment: const Alignment(1, 8),
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: const Text(
                      'Forget Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  SizedBox(
                    height: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      shadowColor: Colors.greenAccent,
                      color: Colors.black,
                      elevation: 7,
                      child: GestureDetector(
                        onTap: () async{
                          _register();
                        },
                        child: const Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Go Back',
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),

                ],
              )
          ),
        ],
      ),
    );
  }
}
