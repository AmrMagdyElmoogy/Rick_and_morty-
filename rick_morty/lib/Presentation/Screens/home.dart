import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/Business_logic/cubit/character_cubit.dart';
import 'package:rick_morty/Business_logic/cubit/character_state.dart';

class Home extends StatelessWidget {
  Home();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterCubit, CharacterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CharacterCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Rick and Morty',
              style: Theme.of(context).textTheme.headline3.copyWith(
                    fontSize: 20,
                    fontFamily: 'Nutio',
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changetIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_rounded,
                  ),
                  label: '.'),
              BottomNavigationBarItem(icon: Icon(Icons.info), label: '.'),
            ],
          ),
        );
      },
    );
  }
}
