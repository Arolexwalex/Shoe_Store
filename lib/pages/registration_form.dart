import 'package:flutter/material.dart';
import 'package:shoe_store/pages/login_page.dart';

import '../authentication/authentication.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final Authentication _auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 25.0, top: 25.0),
            child: Center(child: Text('Registration Page')),
          ),
        ),
        
        body: Form(
          key: _formKey,
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
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
              const SizedBox(height: 16,),

              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                
                    if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                    
                    if (value != _passwordController.text) {
                      // Compare with the stored password value
                
                      return 'Password do not match';
                      
                    } return null;
                  },
                 
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton(onPressed: () async {
                if (_formKey.currentState!.validate()){

                  try{
                    await 
                    _auth.createUserWithEmailAndPassword(
                      _emailController.text, _passwordController.text);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Registration Successful!'),
                        backgroundColor: Colors.green),
                        );
                        Future.delayed(const Duration(
                          seconds: 2
                        ), () {
                          Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );

                        }
                        );

                    
                  } catch (e) {

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error:$e'),
                      backgroundColor: Colors.red,),
                    );
                  }
                  
                  // Register user here
                
                }
              }, child: Text('Register')),

            ],
        
        
          )
          ),
      );
    
  }
}