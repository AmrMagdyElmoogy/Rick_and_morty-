class CharacterModel {
  List<Results> results = [];

  CharacterModel.fromJson(Map<String, dynamic> json) {
    results.add(Results.fromJson(json));
  }
}

class Results {
  int id;
  String name;
  String species;
  String gender;
  String status;
  String image;

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    species = json['species'];
    status = json['status'];
    gender = json['gender'];
    image = json['image'];
  }
}
