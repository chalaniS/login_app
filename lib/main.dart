import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var app = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => const SignupPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(15, 110, 0, 0),
            child: const Text(
              "Hello chalani",
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
                const TextField(
                  decoration: InputDecoration(
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
                const TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color:Colors.green),
                      ),
                  ),
                  obscureText: true,
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
                      onTap: (){},
                      child: const Center(
                        child: Text(
                          'LOGIN',
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
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
