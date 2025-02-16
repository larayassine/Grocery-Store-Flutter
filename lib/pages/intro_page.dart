import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/pages/second_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(
                left: 40.0, right: 40, bottom: 10, top: 140),
            child: Image.asset('assets/images/logo.jpg'),
          ),
          //we deliver groceries to your dorrstep
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, bottom: 10, top: 10),
            child: Text(
              "WE DELIVER GROCERIES TO YOUR DOORSTEPS!",
              style: GoogleFonts.notoSerif(
                  fontSize: 35, fontWeight: FontWeight.w400),
            ),
          ),

          //subtitle
          const Padding(
            padding: EdgeInsets.only(left: 30.0, right: 20, bottom: 10, top: 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "F R E S H    I T E M S   E V E R Y D A Y ",
                style: TextStyle(
                    color: Color.fromARGB(255, 61, 61, 61),
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          const Spacer(),
          //get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return SecondPage();
            })),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(25),
              child: const Text(
                "GET STARTED",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
