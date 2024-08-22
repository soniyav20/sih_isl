import 'package:flutter/material.dart';
import 'package:sih/screens/notifications_page.dart';

import '../constants.dart';

class LearnPronunciationPage extends StatelessWidget {
  const LearnPronunciationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  secondary,
      appBar: AppBar(
        title: const Text('Lip Reading',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor:  primary,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/lips.png')),
            const SizedBox(height: 10),

            const SizedBox(height: 30),
            Center(
              child: RichText(
                text:  TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                  children: const [
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
            const SizedBox(height: 30),
 Padding(
  padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 24),
  child: Divider(color:primary ,),
),
            const SizedBox(height: 30),
            Center(
              child: RichText(
                text:  TextSpan(
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primary,
                  ),
                  children: const [
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
