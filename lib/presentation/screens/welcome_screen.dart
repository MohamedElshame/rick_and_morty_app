import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_app/constants/colors.dart';
import 'package:rick_and_morty_app/constants/strings.dart';
import 'package:rive/rive.dart';
import 'package:rick_and_morty_app/animations/morty_enum.dart';

class Welcomescreen extends StatefulWidget {
  const Welcomescreen({super.key});

  @override
  State<Welcomescreen> createState() => _WelcomescreenState();
}

class _WelcomescreenState extends State<Welcomescreen> {
  late RiveAnimationController _controller;
  bool isOldMan = false;

  @override
  void initState() {
    super.initState();
    _startBoyAnimation();
  }

  void _startBoyAnimation() {
    setState(() {
      _controller = SimpleAnimation(MortyAnimation.boy_appear.name);
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _controller = SimpleAnimation(MortyAnimation.boy_animation.name);
          });
        }
      });
    });
  }

  void _startOldManAnimation() {
    setState(() {
      _controller = SimpleAnimation(MortyAnimation.old_men_appear.name);
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _controller = SimpleAnimation(MortyAnimation.old_men_animation.name);
          });
        }
      });
    });
  }

  void _handleTap() {
    if (!isOldMan) {
      setState(() {
        _controller = SimpleAnimation(MortyAnimation.boy_face_disapear.name);
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _startOldManAnimation();
            isOldMan = true;
          }
        });
      });
    } else {
      setState(() {
        _controller = SimpleAnimation(MortyAnimation.old_men_disappear.name);
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            _startBoyAnimation();
            isOldMan = false;
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolors.MyPurple,
      body: SafeArea(
        child: Column(
          
          children: [
            SizedBox(height: 20,),
            Center(
              child: 
              
              Text(
                "Rick And Morty World",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
           SizedBox(height: 20,),
            Expanded(
              child: Center(
                
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: GestureDetector(
                    onTapDown: (_) => _handleTap(),
                    child: RiveAnimation.asset(
                      'assets/images/riv/rickmortyani.riv',
                      controllers: [_controller],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),



              ),
            ),

Center(
  
child: Padding(padding: EdgeInsets.all(140),
  
  child: 


ElevatedButton(onPressed: (){
Navigator.pushNamed(context, characterscreen);

},
style: ElevatedButton.styleFrom(
       backgroundColor: Mycolors.Myblue,
      padding: EdgeInsets.all( 33),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 5,
      shadowColor: Colors.black,
          ),
 child: Text("Alright, let's go!",style: GoogleFonts.montserrat(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),))


,

  
 
) ,




),

         

          ],
          
        ),
        
      ),
    );
  }
}