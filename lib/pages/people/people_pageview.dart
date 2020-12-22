import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/people/people_list.dart';
import 'package:flutter_api_sample/services/swapi_api.dart';
import 'package:flutter_api_sample/swapi_shared_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _peoplePageLinkStateProvider =
    StateProvider<String>((_) => 'https://swapi.dev/api/people/');

final _peoplePageFutureProvider = FutureProvider<PeoplePageModel>((ref) async {
  final url = ref.watch(_peoplePageLinkStateProvider).state;
  final repo = ref.read(SwapiRepository.provider);
  final data = await repo.dataFromUrl(url);
  return PeoplePageModel.fromJson(data);
});

class PeoplePageView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _peoplePageLink = useProvider(_peoplePageLinkStateProvider).state;
    final _peoplePageFuture = useProvider(_peoplePageFutureProvider);

    return _peoplePageFuture.when(
        data: (peoplePage) => Column(
              children: [
                Expanded(child: PeopleList(peoplePage.results)),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios_rounded),
                            onPressed: () {
                              if (peoplePage.previous != null) {
                                context
                                    .refresh(_peoplePageLinkStateProvider)
                                    .state = peoplePage.previous;
                              }
                            }),
                        BottomUrlContainer(url: '$_peoplePageLink'),
                        IconButton(
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                            onPressed: () async {
                              if (peoplePage.next != null) {
                                context
                                    .refresh(_peoplePageLinkStateProvider)
                                    .state = peoplePage.next;
                              }
                            })
                      ],
                    ),
                  ),
                )
              ],
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorWidget(_));
  }
}
