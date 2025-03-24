import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcomescreen extends StatelessWidget {
 
const Welcomescreen({super.key});


@override

  Widget build(BuildContext context) {
    
    return Scaffold(

body:SafeArea(child:  Column(

children: [

  Center(
    child:
Text("Welcome!\nTo\nRick And Morty World",style: GoogleFonts.montserrat(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),)
  )




],





),

)
    );
  }



}