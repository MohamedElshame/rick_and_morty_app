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
  late List<dynamic> episode;
  late String url;
  late String createdtime;

  Character.fromJson(Map<String,dynamic> json){
    id = json["id"];
    name = json["name"] ?? "Unknown";
    status = json["status"] ?? "Unknown";
    species = json["species"] ?? "Unknown";
    type = json["type"] ?? "";
    gender = json["gender"] ?? "Unknown";
    originland = json["origin"] ?? {"name": "Unknown", "url": ""};
    location = json["location"] ?? {"name": "Unknown", "url": ""};
    image = json["image"] ?? "";
    episode = json["episode"] ?? [];
    url = json["url"] ?? "";
    createdtime = json["created"] ?? "";
  }
}