
//! this is the  first class that takes data 
import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/constants/strings.dart';

class CharactersApi {
late Dio dio ;

CharactersApi(){
  BaseOptions options =BaseOptions(
baseUrl: baseurl,
receiveDataWhenStatusError: true,
connectTimeout: Duration(milliseconds: 60 * 1000),
receiveTimeout: Duration(milliseconds: 60*1000),

  );
  dio = Dio(options);

}
Future<List<dynamic>> getAllcharacters() async{
try{
Response response =await dio.get("character");

print(response.data.toString());
return response.data;



}



catch(e){
print(e.toString());
return [];


}




}




}