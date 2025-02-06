import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:25),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
          
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'lib/images/nike2.webp',
                  height: 240,
                        
                
                ),
              ),
          
              const SizedBox(height: 48),
          
              // title
          
              Text('Just Do It',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ) ,),



              // Sub title
                const SizedBox(height: 48),
          
                Text('Brand new sneakers and custom kicks made with premium quality',
            
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey
              ),
              textAlign: TextAlign.center,
              ),
          
          
          
              // start now button
               const SizedBox(height: 48),

               GestureDetector(
                onTap: ()=> Navigator.push
                (context, MaterialPageRoute
                (builder: (context) => HomePage(),
                ),
                ),
                 child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Center(
                      child: const Text('Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      ),
                    ),
                  ),
                 ),
               )


            ],
          ),
        ),
      ),
    );
  }
}