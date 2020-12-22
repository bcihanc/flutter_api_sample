import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/vehicles/vehicle_list.dart';
import 'package:flutter_api_sample/services/swapi_api.dart';
import 'package:flutter_api_sample/swapi_shared_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

final _vehiclePageLinkStateProvider =
    StateProvider<String>((_) => 'https://swapi.dev/api/vehicles/');

final _vehiclesPageFutureProvider =
    FutureProvider<VehiclesPageModel>((ref) async {
  final url = ref.watch(_vehiclePageLinkStateProvider).state;
  final repo = ref.read(SwapiRepository.provider);
  final data = await repo.dataFromUrl('$url');
  return VehiclesPageModel.fromJson(data);
});

class VehiclesPageView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _vehiclePageLink = useProvider(_vehiclePageLinkStateProvider).state;
    final _vehiclesPageFuture = useProvider(_vehiclesPageFutureProvider);

    return _vehiclesPageFuture.when(
        data: (vehiclesPage) => Column(
              children: [
                Expanded(child: VehicleList(vehiclesPage.results)),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios_rounded),
                            onPressed: () {
                              if (vehiclesPage.previous != null) {
                                context
                                    .refresh(_vehiclePageLinkStateProvider)
                                    .state = vehiclesPage.previous;
                              }
                            }),
                        BottomUrlContainer(url: '$_vehiclePageLink'),
                        IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            onPressed: () async {
                              if (vehiclesPage.next != null) {
                                context
                                    .refresh(_vehiclePageLinkStateProvider)
                                    .state = vehiclesPage.next;
                              }
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          debugPrint(stack.toString());
          return ErrorWidget(err);
        });
  }
}
