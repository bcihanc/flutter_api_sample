import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/films/films_list.dart';
import 'package:flutter_api_sample/pages/planets/planet_details.dart';
import 'package:flutter_api_sample/services/swapi_api.dart';
import 'package:flutter_api_sample/swapi_shared_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PeopleDetails extends HookWidget {
  const PeopleDetails(this.people);
  final PeopleModel people;

  @override
  Widget build(BuildContext context) {
    final busy = useProvider(BusyState.provider.state) ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text('${people.name}'),
        centerTitle: false,
        actions: [BusyCircularProgressIndicator()],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: ListTile.divideTiles(context: context, tiles: [
                ListTile(
                  leading: Icon(MdiIcons.genderMaleFemale),
                  title: Text('${people.gender}'),
                  subtitle: Text('gender'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.cakeLayered),
                  title: Text('${people.birthYear}'),
                  subtitle: Text('birth year'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.weight),
                  title: Text('${people.mass} kg'),
                  subtitle: Text('mass'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.humanMaleHeight),
                  title: Text('${people.height} cm'),
                  subtitle: Text('height'),
                ),
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text('${people.hairColor}'),
                  subtitle: Text('hair color'),
                ),
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text('${people.skinColor}'),
                  subtitle: Text('skin color'),
                ),
                ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text('${people.eyeColor}'),
                  subtitle: Text('eye color'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.googleEarth),
                  title: Text('Homeworld'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => _handleHomeworldOnTap(context),
                ),
                ListTile(
                  leading: Icon(MdiIcons.film),
                  title: Text('Films (${people.films.length})'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => _handlePeoplesOnTap(context),
                  enabled: !busy,
                )
              ]).toList(),
            ),
          ),
          SafeArea(
            child: BottomUrlContainer(
              url: '${people.url}',
            ),
          )
        ],
      ),
    );
  }

  Future<void> _handleHomeworldOnTap(BuildContext context) async {
    final repo = context.read(SwapiRepository.provider);
    final data = await repo.dataFromUrl(people.homeworld);
    final planet = PlanetModel.fromJson(data);
    PlanetDetail.push(context, planet);
  }

  Future<void> _handlePeoplesOnTap(BuildContext context) async {
    final repo = context.read(SwapiRepository.provider);
    final dataList = await repo.datasFromUrls(people.films);
    final films = dataList.map((e) => FilmModel.fromJson(e)).toList();
    FilmsList.push(context, films);
  }
}
