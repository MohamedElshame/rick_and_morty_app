import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/presentation/screens/welcome_screen.dart';

class AppRouter {
Route ?generateroute(RouteSettings settings){

switch(settings.name){
  case "/":

  return MaterialPageRoute(builder: (_) => Welcomescreen() );


}





}


}