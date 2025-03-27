import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_app/constants/colors.dart';
import 'package:rick_and_morty_app/data/models/characters.dart';

class CharacterItem extends StatelessWidget{

final Character  character;

 const CharacterItem({super.key , required this.character});

  @override
  Widget build(BuildContext context) {
   return Container(
width:  double.infinity,

//Todo momken a3del fe el amrgin
margin:  EdgeInsetsDirectional.all(8),
padding: EdgeInsetsDirectional.all(4),
decoration: BoxDecoration(
color: Mycolors.Myblue,
borderRadius: BorderRadius.circular(20),


),
child:
 GridTile(child: Container(
color: Mycolors.MyPurple,
child: character.image.isNotEmpty ?
FadeInImage.assetNetwork(
  width: double.infinity,
  height: double.infinity,
  placeholder: 
"assets/images/riv/loadingmorti.gif",
 image: character.image,
 fit: BoxFit.cover,):

Image.asset("assets/images/riv/placeholder.png",)





),
footer:Container(
width: double.infinity,
padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
color: Colors.black54,
alignment: Alignment.bottomCenter,

child: Text("${character.name}",style: GoogleFonts.montserrat(color:Colors.white, textStyle: TextStyle(height: 1.3,fontSize: 17),fontWeight: FontWeight.bold ),

overflow: TextOverflow.ellipsis,
maxLines: 2,
textAlign: TextAlign.center,

),
) ,


),


   );
  }


}