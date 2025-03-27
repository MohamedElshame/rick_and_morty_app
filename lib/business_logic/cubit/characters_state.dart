part of 'characters_cubit.dart';

@immutable
sealed class CharactersState {}

final class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Character> characters;
  CharactersLoaded(this.characters);
}

class CharactersLoadingMore extends CharactersState {
  final List<Character> characters;
  CharactersLoadingMore(this.characters);
}

class CharactersNoMoreData extends CharactersState {
  final List<Character> characters;
  CharactersNoMoreData(this.characters);
}

class CharactersError extends CharactersState {
  final String errorMessage;
  CharactersError(this.errorMessage);
}
