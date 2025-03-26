import 'package:rick_and_morty_app/data/models/characters.dart';
import 'package:rick_and_morty_app/data/web_serv/characters%20_api.dart';
//! the web services passes the data to the repository

class CharactersRepository {
final CharactersApi charactersApi ;
CharactersRepository(this.charactersApi);

//? repo passes the data to cubit same as web services 
//! Used the same object name as in the other folder  
//? since they have nearly the same functionality.
Future<List<Character>> getAllcharacters() async{
final characters=await charactersApi.getAllcharacters();

return characters.map((character)=>Character.fromJson(character)).toList();


}

}



