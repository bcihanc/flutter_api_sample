import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/people/people_list.dart';
import 'package:flutter_api_sample/services/swapi_api.dart';
import 'package:flutter_api_sample/swapi_shared_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PlanetDetail extends HookWidget {
  const PlanetDetail(this.planet);
  final PlanetModel planet;

  static void push(BuildContext context, PlanetModel planet) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlanetDetail(planet)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final busy = useProvider(BusyState.provider.state) ?? false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('${planet.name}'),
        actions: [BusyCircularProgressIndicator()],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(MdiIcons.terrain),
            title: Text('${planet.terrain}'),
            subtitle: Text('terrain'),
          ),
          ListTile(
            leading: Icon(MdiIcons.faceWoman),
            title: Text('${planet.population}'),
            subtitle: Text('population'),
          ),
          ListTile(
            leading: Icon(MdiIcons.airFilter),
            title: Text('${planet.climate}'),
            subtitle: Text('climate'),
          ),
          ListTile(
            leading: Icon(MdiIcons.diameter),
            title: Text('${planet.diameter}'),
            subtitle: Text('diameter'),
          ),
          ListTile(
            leading: Icon(MdiIcons.weight),
            title: Text('${planet.gravity}'),
            subtitle: Text('gravity'),
          ),
          ListTile(
            leading: Icon(MdiIcons.rotateOrbit),
            title: Text('${planet.rotationPeriod}'),
            subtitle: Text('rotation period'),
          ),
          ListTile(
            leading: Icon(MdiIcons.water),
            title: Text('${planet.surfaceWater}'),
            subtitle: Text('surface water'),
          ),
          ListTile(
            leading: Icon(MdiIcons.human),
            title: Text('Residents (${planet.residents.length})'),
            trailing: Icon(Icons.keyboard_arrow_right),
            enabled: !busy,
            onTap: () => _handleResidentListTileOnTap(context),
          )
        ],
      ),
    );
  }

  Future<void> _handleResidentListTileOnTap(BuildContext context) async {
    final repo = context.read(SwapiRepository.provider);
    final datas = await repo.datasFromUrls(planet.residents);
    final residents = datas.map((e) => PeopleModel.fromJson(e)).toList();
    PeopleList.push(context, residents);
  }
}
