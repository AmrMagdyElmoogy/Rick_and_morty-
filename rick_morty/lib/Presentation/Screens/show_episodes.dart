import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/Business_logic/cubit/character_cubit.dart';
import 'package:rick_morty/Business_logic/cubit/character_state.dart';
import 'package:rick_morty/Data/Models/episode_model.dart';

class ShowEpisodes extends StatelessWidget {
  const ShowEpisodes();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CharacterCubit, CharacterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = CharacterCubit.get(context).episodeModel;
        return model.length > 0
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Episode Info',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Characters',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  sperator(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildEpisodeItem(context, model[index].results[0]),
                        separatorBuilder: (context, index) => sperator(),
                        itemCount: model.length),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  Widget buildCharacterName(String name, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline2,
        ));
  }

  Widget buildEpisodeItem(BuildContext context, ResultsOfEpisodes model) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${model.episode}',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${model.dateTime}',
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: List.generate(
          //       model.characterNames.length,
          //       (index) => buildCharacterName(model.name, context)
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }

  Widget sperator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[800],
      ),
    );
  }
}
