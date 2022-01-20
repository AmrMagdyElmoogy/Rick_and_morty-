import 'package:dio/dio.dart';
import 'package:rick_morty/Constrants/constrants.dart';
import 'package:rick_morty/Data/Models/character_model.dart';
import 'package:rick_morty/Data/Models/episode_model.dart';

class WebServices {
  Dio dio;
  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    Response response = await dio.get('character');
    return response.data['results'];
  }

  Future<List<dynamic>> getAllEpisodes() async {
    Response response = await dio.get('episode');
    return response.data['results'];
  }

  // List<String> getImageCharacter(List<String> characters) {
  //   List<String> characterNames = [];
  //   characters.forEach((element) async {
  //     int size = element.length;
  //     String path = 'character/${element[size - 1]}';
  //     dio.get(path).then((value) {
  //       String img = value.data['name'];
  //       print(img);
  //       characterNames.add(img);
  //     });
  //   });
  //   return characterNames;
  // }
}
