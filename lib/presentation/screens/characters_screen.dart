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
 bool isLastPage = false;
 
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
if (state is CharactersLoading && allcharacters.isEmpty) {
  return showLoadingIndicator();
} else if (state is CharactersLoaded || state is CharactersLoadingMore || state is CharactersNoMoreData) {
  if (state is CharactersLoaded) {
    allcharacters = state.characters;
    isLastPage = false;
  } else if (state is CharactersLoadingMore) {
    allcharacters = state.characters;
  } else if (state is CharactersNoMoreData) {
    allcharacters = state.characters;
    isLastPage = true;
  }
  return buildLoadedListWidgets();
} else if (state is CharactersError) {
  return Center(child: Text("خطأ في تحميل البيانات", style: TextStyle(color: Colors.white, fontSize: 20)));
} else {
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
if (!isLastPage) buildLoadMoreButton(),
if (isLastPage) 
  Padding(
    padding: const EdgeInsets.all(15.0),
    child: Text(
      "لا توجد المزيد من الشخصيات",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),


],),




),

);


 }

Widget buildLoadMoreButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        final isLoading = state is CharactersLoadingMore;
        
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Mycolors.Myblue,
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          ),
          onPressed: isLoading 
            ? null 
            : () => BlocProvider.of<CharactersCubit>(context).loadMoreCharacters(),
          child: isLoading
            ? CircularProgressIndicator(color: Colors.white, strokeWidth: 3)
            : Text(
                "تحميل المزيد",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
        );
      },
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