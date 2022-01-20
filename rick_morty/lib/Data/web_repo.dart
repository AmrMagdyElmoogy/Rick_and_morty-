import 'package:rick_morty/Data/Models/character_model.dart';
import 'package:rick_morty/Data/Models/episode_model.dart';
import 'package:rick_morty/Data/web_services.dart';

class WebRepository {
  final WebServices webServices;
  WebRepository(this.webServices);

  Future<List<CharacterModel>> fetchAllCharacter() async {
    final characters = await webServices.getAllCharacters();
    return characters
        .map((element) => CharacterModel.fromJson(element))
        .toList();
  }

  Future<List<Episode>> fetchAllEpisodes() async {
    final episodes = await webServices.getAllEpisodes();
    print(episodes);
    return episodes.map((element) => Episode.fromJson(element)).toList();
  }
}
