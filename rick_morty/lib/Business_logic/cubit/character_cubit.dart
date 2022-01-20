import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/Business_logic/cubit/character_state.dart';
import 'package:rick_morty/Data/Models/character_model.dart';
import 'package:rick_morty/Data/Models/episode_model.dart';
import 'package:rick_morty/Data/web_repo.dart';
import 'package:rick_morty/Data/web_services.dart';
import 'package:rick_morty/Presentation/Screens/show_characters.dart';
import 'package:rick_morty/Presentation/Screens/show_episodes.dart';

class CharacterCubit extends Cubit<CharacterStates> {
  WebRepository webRepository = new WebRepository(WebServices());
  List<CharacterModel> characterModel = [];
  List<CharacterModel> searchItems = [];
  List<Episode> episodeModel = [];

  CharacterCubit(webRepository) : super(CharacterInitialState());

  static CharacterCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    ShowCharacters(),
    ShowEpisodes(),
  ];

  int currentIndex = 0;
  void changetIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexOfBottomNavBar());
  }

  void getCharacters() {
    emit(CharacterLoading());
    webRepository.fetchAllCharacter().then((value) {
      value.forEach((element) {
        characterModel.add(element);
      });
      emit(SuccessGetCharacters());
    }).catchError((onError) {
      print(onError);
      emit(ErrorGetCharacters());
    });
  }

  void getEpisodes() {
    emit(EpisodeLoading());
    webRepository.fetchAllEpisodes().then((value) {
      value.forEach((element) {
        episodeModel.add(element);
        print(episodeModel[0].results[0].name);
      });
      emit(SuccessGetEpisodes());
    }).catchError((onError) {
      print(onError);
      emit(ErrorGetEpisodes());
    });
  }

  void searchFilterCharacters(String text, List<CharacterModel> model) {
    searchItems =
        model.where((element) => element.results[0].name.toLowerCase().startsWith(text)).toList();
    emit(searchChangedState());
  }
}
