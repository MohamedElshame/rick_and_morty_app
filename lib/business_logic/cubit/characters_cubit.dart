import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/data/models/characters.dart';
import 'package:rick_and_morty_app/data/repo/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  int nextCharacterId = 1;
  bool isLoadingMore = false;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character>? getAllcharacters() {
    emit(CharactersLoading());
    charactersRepository.getAllcharacters(startId: 1, count: 20).then((newCharacters) {
      characters = newCharacters;
      nextCharacterId = 21; // نبدأ تحميل المزيد من الشخصية 21
      emit(CharactersLoaded(characters));
    }).catchError((error) {
      emit(CharactersError("حدث خطأ في تحميل الشخصيات: $error"));
    });

    return characters;
  }

  void loadMoreCharacters() {
    if (isLoadingMore) return; // منع تحميل مزدوج

    isLoadingMore = true;
    emit(CharactersLoadingMore(characters));

    charactersRepository.getAllcharacters(startId: nextCharacterId, count: 20).then((newCharacters) {
      if (newCharacters.isEmpty) {
        emit(CharactersNoMoreData(characters));
      } else {
        characters.addAll(newCharacters);
        nextCharacterId += newCharacters.length;
        emit(CharactersLoaded(characters));
      }
      isLoadingMore = false;
    }).catchError((error) {
      emit(CharactersError("حدث خطأ في تحميل المزيد من الشخصيات: $error"));
      isLoadingMore = false;
    });
  }
}
