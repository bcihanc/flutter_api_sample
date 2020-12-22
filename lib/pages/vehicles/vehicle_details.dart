import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/films/films_list.dart';
import 'package:flutter_api_sample/pages/people/people_list.dart';
import 'package:flutter_api_sample/services/swapi_api.dart';
import 'package:flutter_api_sample/swapi_shared_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class VehicleDetails extends HookWidget {
  const VehicleDetails(this.vehicle);
  final VehicleModel vehicle;

  @override
  Widget build(BuildContext context) {
    final busy = useProvider(BusyState.provider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text('${vehicle.name}'),
        centerTitle: false,
        actions: [BusyCircularProgressIndicator()],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: ListTile.divideTiles(context: context, tiles: [
                ListTile(
                  leading: Icon(MdiIcons.factoryIcon),
                  title: Text('${vehicle.manufacturer}'),
                  subtitle: Text('manufacturer'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.face),
                  title: Text('${vehicle.crew}'),
                  subtitle: Text('crew'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.package),
                  title: Text('${vehicle.consumables}'),
                  subtitle: Text('consumables'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.movie),
                  title: Text('${vehicle.cargoCapacity}'),
                  subtitle: Text('Cargo Capacity'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.movie),
                  title: Text('${vehicle.costInCredits}'),
                  subtitle: Text('Cost In Credits'),
                ),
                ListTile(
                  leading: Icon(MdiIcons.human),
                  title: Text('Pilots (${vehicle.pilots.length})'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => _handlePilotsOnTap(context),
                  enabled: !busy,
                ),
                ListTile(
                  leading: Icon(MdiIcons.movie),
                  title: Text('Films (${vehicle.films.length})'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () => _handleFilmsOnTap(context),
                  enabled: !busy,
                ),
              ]).toList(),
            ),
          ),
          SafeArea(
            child: BottomUrlContainer(
              url: '${vehicle.url}',
            ),
          )
        ],
      ),
    );
  }

  Future<void> _handlePilotsOnTap(BuildContext context) async {
    {
      final repo = context.read(SwapiRepository.provider);
      final datas = await repo.datasFromUrls(vehicle.pilots);
      final peoples = datas.map((e) => PeopleModel.fromJson(e)).toList();
      PeopleList.push(context, peoples);
    }
  }

  Future<void> _handleFilmsOnTap(BuildContext context) async {
    {
      final repo = context.read(SwapiRepository.provider);
      final datas = await repo.datasFromUrls(vehicle.films);
      final films = datas.map((e) => FilmModel.fromJson(e)).toList();
      FilmsList.push(context, films);
    }
  }
}
