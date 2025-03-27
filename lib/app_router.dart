import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/constants/strings.dart';
import 'package:rick_and_morty_app/data/repo/characters_repository.dart';
import 'package:rick_and_morty_app/data/web_serv/characters%20_api.dart';
import 'package:rick_and_morty_app/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty_app/presentation/screens/characters_screen_details.dart';

import 'package:rick_and_morty_app/presentation/screens/welcome_screen.dart';

class AppRouter {

late CharactersRepository charactersRepository;
late CharactersCubit charactersCubit;

AppRouter(){
  charactersRepository=CharactersRepository(CharactersApi());
  charactersCubit=CharactersCubit(charactersRepository);
  charactersCubit.getAllcharacters();
}






Route? generateroute(RouteSettings settings){

switch(settings.name){
  //case welcomescreen:

 // return MaterialPageRoute(builder: (_) => Welcomescreen() );

case characterscreen:
return MaterialPageRoute(builder: (_) => BlocProvider(create: 
(BuildContext context)=>
CharactersCubit(charactersRepository),
child: CharactersScreen(),
) 
);

case characterdetailsscreen:
return MaterialPageRoute(builder: (_)=> CharacterScreenDetails());


}






}


}