import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/Business_logic/cubit/character_cubit.dart';
import 'package:rick_morty/Business_logic/cubit/character_state.dart';
import 'package:rick_morty/Data/Models/character_model.dart';

class ShowCharacters extends StatelessWidget {
  ShowCharacters();
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: BlocConsumer<CharacterCubit, CharacterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = CharacterCubit.get(context).characterModel;
          var cubit = CharacterCubit.get(context);
          var searchModel = CharacterCubit.get(context).searchItems;
          return model.length > 0
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Amr!',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: searchController,
                        style: Theme.of(context).textTheme.headline1,
                        cursorColor: Colors.white,
                        onChanged: (searchText) {
                          cubit.searchFilterCharacters(
                              searchText.toLowerCase(), model);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintText: 'Search',
                          hintStyle: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Characters',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CarouselSlider(
                        items: searchController.text.isEmpty
                            ? List.generate(
                                model.length,
                                (index) => buildCardItem(
                                    context, model[index].results[0]),
                              )
                            : List.generate(
                                searchModel.length,
                                (index) => buildCardItem(
                                    context, searchModel[index].results[0]),
                              ),
                        options: CarouselOptions(
                            height: 400,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 0.9),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget buildCardItem(BuildContext context, Results model) {
    String actorName = model.name;
    return Center(
      child: Container(
        width: 280,
        height: 400,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage('${model.image}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              bottom: 100,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${model.species}',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${model.gender}',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${model.status}',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    actorName,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
