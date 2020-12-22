import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/people/people_list.dart';
import 'package:flutter_api_sample/pages/planets/planets_list.dart';
import 'package:flutter_api_sample/pages/vehicles/vehicle_list.dart';
import 'package:flutter_api_sample/services/swapi_api.dart';
import 'package:flutter_api_sample/swapi_shared_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FilmDetails extends HookWidget {
  const FilmDetails(this.film);
  final FilmModel film;

  static void push(BuildContext context, FilmModel film) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilmDetails(film)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final busy = useProvider(BusyState.provider.state) ?? false;

    return Scaffold(
      appBar: AppBar(
        actions: [BusyCircularProgressIndicator()],
        title: Text('${film.title}'),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: ListTile.divideTiles(context: context, tiles: [
              ExpansionTile(
                leading: Icon(MdiIcons.viewArray),
                title: Text('Opening Crawl'),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 16),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${film.openingCrawl}')),
                  )
                ],
              ),
              ListTile(
                  leading: Icon(MdiIcons.calendar),
                  subtitle: Text('Release Date'),
                  title:
                      Text('${film.releaseDate.toString().substring(0, 10)}')),
              ListTile(
                  leading: Icon(MdiIcons.directions),
                  subtitle: Text('Directions'),
                  title: Text('${film.director}')),
              ListTile(
                leading: Icon(MdiIcons.human),
                title: Text('Characters (${film.characters.length})'),
                trailing: Icon(Icons.keyboard_arrow_right),
                enabled: !busy,
                onTap: () async => _handleCharactersOnTap(context),
              ),
              ListTile(
                leading: Icon(MdiIcons.googleEarth),
                title: Text('Planets (${film.planets.length})'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => _handlePlanetsOnTap(context),
                enabled: !busy,
              ),
              ListTile(
                leading: Icon(MdiIcons.spaceStation),
                title: Text('Vehicles (${film.vehicles.length})'),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () => _handleVehiclesOnTap(context),
                enabled: !busy,
              ),
            ]).toList(),
          )),
          SafeArea(child: BottomUrlContainer(url: film.url))
        ],
      ),
    );
  }

  Future<void> _handleCharactersOnTap(BuildContext context) async {
    final repo = context.read(SwapiRepository.provider);
    final datas = await repo.datasFromUrls(film.characters);
    final characters = datas.map((e) => PeopleModel.fromJson(e)).toList();
    PeopleList.push(context, characters);
  }

  Future<void> _handlePlanetsOnTap(BuildContext context) async {
    final repo = context.read(SwapiRepository.provider);
    final datas = await repo.datasFromUrls(film.planets);
    final planets = datas.map((e) => PlanetModel.fromJson(e)).toList();
    PlanetList.push(context, planets);
  }

  Future<void> _handleVehiclesOnTap(BuildContext context) async {
    final repo = context.read(SwapiRepository.provider);
    final datas = await repo.datasFromUrls(film.vehicles);
    final vehicles = datas.map((e) => VehicleModel.fromJson(e)).toList();
    VehicleList.push(context, vehicles);
  }
}
