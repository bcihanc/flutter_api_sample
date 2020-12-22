import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/planets/planet_details.dart';

class PlanetList extends StatelessWidget {
  const PlanetList(this.planets);
  final List<PlanetModel> planets;

  static void push(BuildContext context, List<PlanetModel> planets) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlanetList(planets)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModalRoute.of(context).settings.name != '/'
          ? AppBar(
              title: Text('Planets'),
              centerTitle: false,
            )
          : null,
      body: ListView(
        children: ListTile.divideTiles(
                context: context,
                tiles: planets
                    .map((planet) => ListTile(
                          title: Text('${planet.name}'),
                          subtitle: Text('${planet.terrain}'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => PlanetDetail.push(context, planet),
                        ))
                    .toList())
            .toList(),
      ),
    );
  }
}
