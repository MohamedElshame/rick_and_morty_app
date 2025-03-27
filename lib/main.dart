import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/app_router.dart';
import 'package:rick_and_morty_app/constants/strings.dart';

void main() {
  final AppRouter appRouter = AppRouter();
  runApp(RickAndMortyApp(appRouter: appRouter));
}

class RickAndMortyApp extends StatelessWidget {
  final AppRouter appRouter;
  const RickAndMortyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appRouter.charactersCubit,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: characterscreen,
        onGenerateRoute: appRouter.generateroute,
      ),
    );
  }
}

