import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/data/models/characters.dart';
import 'package:rick_and_morty_app/data/repo/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  final CharactersRepository charactersRepository;
  late List<Character> characters ;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

List<Character> ?getAllcharacters(){
  charactersRepository.getAllcharacters().then((characters){
emit(CharactersLoaded(characters));
this.characters=characters;


  });

return characters;


}



}
