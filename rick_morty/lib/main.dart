import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/Business_logic/bloc/bloc_observer.dart';
import 'package:rick_morty/Business_logic/cubit/character_cubit.dart';
import 'package:rick_morty/Constrants/constrants.dart';
import 'package:rick_morty/Data/web_repo.dart';
import 'package:rick_morty/Data/web_services.dart';
import 'package:rick_morty/Presentation/Screens/show_characters.dart';

import 'Presentation/Screens/home.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CharacterCubit(WebRepository(WebServices()))..getCharacters()..getEpisodes()),
      ],
      child: MaterialApp(
        theme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}
