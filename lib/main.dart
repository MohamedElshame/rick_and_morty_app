import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/app_router.dart';

void main() {
  runApp( RickAndMortyApp(appRouter:AppRouter()));
}
class RickAndMortyApp extends StatelessWidget {

  final AppRouter appRouter;
  const RickAndMortyApp({super.key , required this.appRouter});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
  onGenerateRoute: appRouter.generateroute,
    
    );
  }
}

