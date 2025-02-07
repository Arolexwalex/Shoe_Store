import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoe_store/pages/intro_page.dart';
import 'package:shoe_store/pages/registration_form.dart';
import '../authentication/authentication.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final Authentication _auth = Authentication();
  String? _errorMessage;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Login Page')),
        ),
        body: Form(
          key: _formKey,
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 10),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              
                 validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter your email';
                        
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  
                      return null;
                    },
                    
              ),
            ),

            const SizedBox( height: 16,),

              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10, right: 10),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } 
                
                    if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                 
                
                    return null;
                  },
                 
                ),
              ),

              const SizedBox(height: 25,),

              ElevatedButton(onPressed: () async {
                if (_formKey.currentState!.validate()) {

                 try {
                  await 
                  _auth.signInWithEmailAndPassword(
                    _emailController.text, _passwordController.text);
                 
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(builder:(context) => IntroPage()
                  ),
                  );
                } on 
                FirebaseAuthException catch (e) {
                  print('Error code: ${e.code}');
                  print('Error message: ${e.message}');
                  
                  if (e.code == 'user-not-found') {
                    _errorMessage = 'User not found';
                    
                  } else if (e.code == 'invalid-email'){
                    _errorMessage = 'Invalid Email';
                  
                  } else if (e.code == 'wrong-password'){
                    _errorMessage = 'Incorrect Password';
                  }else {
                    _errorMessage = 'An error occured';
                  }

                  setState(() {
                    
                  });
                }
                }
                // Login user here
                

              },
              
               child: Text('Login'),
              ),
              Text(
                _errorMessage ?? '',
                style: TextStyle(color: Colors.red),
              ),

              const SizedBox(height: 25,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a user?'),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationForm()),
                    );
                  }, child: Text('Please, Sign up'),
                  ),
                ],
              )


          ],
        )
        ),
        
      ),
    );
  }
}