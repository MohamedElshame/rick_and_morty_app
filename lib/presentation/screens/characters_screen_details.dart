

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/constants/colors.dart';
import 'package:rick_and_morty_app/data/models/characters.dart';
import 'package:rick_and_morty_app/presentation/widgets/character_item.dart';

class CharacterScreenDetails extends StatefulWidget {
  const CharacterScreenDetails({super.key});

  @override
  State<CharacterScreenDetails> createState() => _CharacterScreenDetailsState();
}

class _CharacterScreenDetailsState extends State<CharacterScreenDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Details'),
      ),
      body: const Center(
        child: Text('Character details will be displayed here.'),
      ),
    );
  }
}