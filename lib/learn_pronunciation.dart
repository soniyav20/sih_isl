import 'package:flutter/material.dart';

class LearnPronunciationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF7CF),
      appBar: AppBar(
        title: Text('Lip Recognition',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFFA28F2D), // Matching the theme color
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () { Navigator.pop(context); },),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add some images in a Column
            Center(child: Image.asset('assets/lips.png')), // Replace with your image asset
            SizedBox(height: 10),

            SizedBox(height: 30), // Space between images and text
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA28F2D),
                  ),
                  children: [
                    TextSpan(text: 'What   is   your  \n'),
                    TextSpan(
                      text: ' name? ',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Color(0xffEAD87C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30), // Space between images and text
Padding(
  padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 24),
  child: Divider(color:Color(0xFFA28F2D) ,),
),
            SizedBox(height: 30), // Space between images and text
            Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFA28F2D),
                  ),
                  children: [
                    TextSpan(text: 'wɒt   ɪz   jɔːr   '),
                    TextSpan(
                      text: ' neɪm?',
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Color(0xffEAD87C),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
