import 'package:dio/dio.dart';
import 'package:rick_morty/Data/web_services.dart';

class Episode {
  List<ResultsOfEpisodes> results = [];
  Episode.fromJson(Map<String, dynamic> json) {
    results.add(ResultsOfEpisodes.fromJson(json));
  }
}

class ResultsOfEpisodes {
  String name;
  String dateTime;
  String episode;
  List<String> characters = [];
  List<String> characterNames = [];
  WebServices webServices = WebServices();
  ResultsOfEpisodes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dateTime = json['air_date'];
    episode = json['episode'];
    json['characters'].forEach((element) {
      characters.add(element);
    });
    // webServices
    //     .getImageCharacter(characters)
    //     .map((element) => characterNames.add(element));
  }
}
