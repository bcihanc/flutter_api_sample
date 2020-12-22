import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/planets/planets_list.dart';
import 'package:flutter_api_sample/services/swapi_api.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../swapi_shared_widgets.dart';

final _planetsPageLinkStateProvider =
    StateProvider<String>((_) => 'https://swapi.dev/api/planets/');

final _planetsPageFutureProvider =
    FutureProvider<PlanetsPageModel>((ref) async {
  final url = ref.watch(_planetsPageLinkStateProvider).state;
  final repo = ref.read(SwapiRepository.provider);
  final data = await repo.dataFromUrl(url);
  return PlanetsPageModel.fromJson(data);
});

class PlanetsPageView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _planetsPageLinkState = useProvider(_planetsPageLinkStateProvider);
    final _planetsPageFuture = useProvider(_planetsPageFutureProvider);

    return _planetsPageFuture.when(
        data: (planetsPage) {
          return Column(
            children: [
              Expanded(child: PlanetList(planetsPage.results)),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios_rounded),
                          onPressed: () {
                            if (planetsPage.previous != null) {
                              context
                                  .read(_planetsPageLinkStateProvider)
                                  .state = planetsPage.previous;
                            }
                          }),
                      BottomUrlContainer(url: '${_planetsPageLinkState.state}'),
                      IconButton(
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                          onPressed: () async {
                            if (planetsPage.next != null) {
                              context
                                  .read(_planetsPageLinkStateProvider)
                                  .state = planetsPage.next;
                            }
                          })
                    ],
                  ),
                ),
              )
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorWidget(_));
  }
}
