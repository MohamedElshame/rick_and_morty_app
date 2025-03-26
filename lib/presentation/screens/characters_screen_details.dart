

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/constants/colors.dart';
import 'package:rick_and_morty_app/data/models/characters.dart';
import 'package:rick_and_morty_app/presentation/widgets/character_item.dart';

class CharacterScreenDetails extends StatefulWidget{

  const CharacterScreenDetails({super.key});

  @override
  State<CharacterScreenDetails> createState() => _CharacterScreenDetailsState();
}

class _CharacterScreenDetailsState extends State<CharacterScreenDetails> {
 

 late List<Character> ?allcharacters;
 
 @override
  void initState() {
   
    super.initState();

allcharacters = 
BlocProvider.of<CharactersCubit>(context).getAllcharacters();

  }
 Widget buildBlocWidget(){

return BlocBuilder< CharactersCubit, CharactersState>
(builder: (context, state )

{
if (state is CharactersLoaded){

allcharacters =state.characters;


return buildLoadedListWidgets();

}
else{
return showLoadingIndicator();

}
},

);



 }
Widget showLoadingIndicator(){
return Center(

child:  CircularProgressIndicator(
  color: Mycolors.Myblue,
),


);



}


 Widget buildLoadedListWidgets(){
return SingleChildScrollView(
child: Container(

color: Mycolors.MyBeige,
child: Column(children: [
buildCharactersList(),


],),




),

);


 }

Widget buildCharactersList(){

return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
childAspectRatio: 2/3,
crossAxisSpacing: 1,
mainAxisSpacing: 1,
),
shrinkWrap: true,
physics: ClampingScrollPhysics()
, itemBuilder:(ctx,index){
//todo not done yet
return CharacterItem();



}


,);



}

  @override
 
  Widget build(BuildContext context) {
   return Scaffold(
backgroundColor: Mycolors.MyPurple,

body: buildBlocWidget(),






   );
  }
}