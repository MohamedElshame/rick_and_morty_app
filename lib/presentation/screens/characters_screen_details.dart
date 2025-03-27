

import 'package:flutter/material.dart';

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