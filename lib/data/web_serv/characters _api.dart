//! this is the  first class that takes data 
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/constants/strings.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi(){
    BaseOptions options = BaseOptions(
      baseUrl: baseurl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(milliseconds: 60 * 1000),
      receiveTimeout: Duration(milliseconds: 60 * 1000),
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllcharacters({int startId = 1, int count = 20}) async {
    try {
      // Get characters by ID range
      List<dynamic> allCharacters = [];
      
      for (int i = startId; i < startId + count; i++) {
        try {
          Response response = await dio.get("character/$i");
          print("Fetched character $i: ${response.data["name"]}");
          allCharacters.add(response.data);
        } catch (e) {
          print("Error fetching character $i: $e");
          // Continue with next character if one fails
        }
      }
      
      print("Total characters fetched: ${allCharacters.length}");
      return allCharacters;
    } catch (e) {
      print("Error in getAllcharacters: $e");
      return [];
    }
  }
}