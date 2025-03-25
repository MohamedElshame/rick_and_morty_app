class Character {
late int id;
late String name;
late String status;
late String species;
 late String type;
late String gender;
 late Map<String,dynamic> originland;
late Map<String,dynamic> location;
late String image;
late List<String> episode;
late String url;
late String createdtime;



Character.fromJson(Map<String,dynamic> json){

id=json["id"];
name =json["name"];
status=json["status"];
species=json["species"];
type=json["type"];
gender=json["gender"];
originland=json["origin"];
location=json["location"];
image=json["image"];
episode=json["episode"];
url=json["url"];
createdtime=json["created"];





}







}