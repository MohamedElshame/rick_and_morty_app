import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/constants/strings.dart';
import 'package:rick_and_morty_app/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty_app/presentation/screens/characters_screen_details.dart';

import 'package:rick_and_morty_app/presentation/screens/welcome_screen.dart';

class AppRouter {
Route ?generateroute(RouteSettings settings){

switch(settings.name){
  case welcomescreen:

  return MaterialPageRoute(builder: (_) => Welcomescreen() );

case characterscreen:
return MaterialPageRoute(builder: (_) => CharactersScreen());

case characterdetailsscreen:
return MaterialPageRoute(builder: (_)=> CharacterScreenDetails());


}






}


}