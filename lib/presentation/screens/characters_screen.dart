import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/constants/colors.dart';
import 'package:rick_and_morty_app/data/models/characters.dart';
import 'package:rick_and_morty_app/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget{

  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
 

 late List<Character> allcharacters;
 
 @override
  void initState() {
   
    super.initState();

allcharacters = 
BlocProvider.of<CharactersCubit>(context).getAllcharacters() ?? [];

//! مش عارف ليه

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
    child: Image.asset(
      "assets/images/loadingmorti.gif",
      width: 200,
      height: 200,
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
physics: ClampingScrollPhysics(),
itemCount:allcharacters.length
, itemBuilder:(ctx,index){
//todo not done yet
return CharacterItem(character: allcharacters[index],);



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