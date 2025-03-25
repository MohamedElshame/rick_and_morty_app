import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Color(0x1ff725197),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                "Welcome!\nTo\nRick And Morty World",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 300,
                  height: 300,
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
          ],
        ),
      ),
    );
  }
}