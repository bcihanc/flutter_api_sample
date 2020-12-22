import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/services/swapi_api.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import '../../swapi_shared_widgets.dart';
import 'films_list.dart';

final _filmPageFutureProvider = FutureProvider<FilmsPageModel>((ref) async {
  final repo = ref.read(SwapiRepository.provider);
  final data = await repo.dataFromUrl('https://swapi.dev/api/films/');
  return FilmsPageModel.fromJson(data);
});

class FilmsPageView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _filmPageFuture = useProvider(_filmPageFutureProvider);

    return _filmPageFuture.when(
        data: (filmsPage) => Column(
              children: [
                Expanded(child: FilmsList(filmsPage.results)),
                SafeArea(
                    child:
                        BottomUrlContainer(url: 'https://swapi.dev/api/films/'))
              ],
            ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorWidget(_));
  }
}
