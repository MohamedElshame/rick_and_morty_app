import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_app/constants/colors.dart';
import 'package:rick_and_morty_app/data/models/characters.dart';

class CharacterItem extends StatelessWidget{

final Character character;

 const CharacterItem({super.key , required this.character});

  @override
  Widget build(BuildContext context) {
   return Container(
width: double.infinity,

//Todo momken a3del fe el amrgin
margin: EdgeInsetsDirectional.all(8),
padding: EdgeInsetsDirectional.all(4),
decoration: BoxDecoration(
color: Mycolors.Myblue,
borderRadius: BorderRadius.circular(20),
),
child:
 GridTile(
  footer: Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    color: Colors.black54,
    alignment: Alignment.bottomCenter,
    child: Text(
      character.name,
      style: GoogleFonts.montserrat(
        color: Colors.white, 
        textStyle: TextStyle(height: 1.3, fontSize: 17),
        fontWeight: FontWeight.bold
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.center,
    ),
  ),
  child: Container(
    color: Mycolors.MyPurple,
    child: character.image.isNotEmpty 
      ? Image.network(
          character.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: Mycolors.Myblue,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            print("Error loading image: $error");
            return Image.asset(
              "assets/images/placeholder.png",
              fit: BoxFit.cover,
            );
          },
        ) 
      : Image.asset(
          "assets/images/placeholder.png",
          fit: BoxFit.cover,
        ),
    ),
  ),
 );
}
}