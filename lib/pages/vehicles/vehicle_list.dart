import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/vehicles/vehicle_details.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehicleList extends HookWidget {
  const VehicleList(this.vehicles);
  final List<VehicleModel> vehicles;

  static void push(BuildContext context, List<VehicleModel> vehicles) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VehicleList(vehicles)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModalRoute.of(context).settings.name == '/'
          ? null
          : AppBar(
              centerTitle: false,
              title: Text('Vehicles'),
            ),
      body: ListView(
        children: ListTile.divideTiles(
                context: context,
                tiles: vehicles.map((vehicle) {
                  Future<void> _handleOnTap() async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VehicleDetails(vehicle)));
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      dense: true,
                      onTap: _handleOnTap,
                      title: Text('${vehicle.name}',
                          style: TextStyle(fontSize: 16)),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      subtitle: Opacity(
                        opacity: 0.5,
                        child: Text('${vehicle.manufacturer}', maxLines: 1),
                      ),
                    ),
                  );
                }).toList())
            .toList(),
      ),
    );
  }
}
