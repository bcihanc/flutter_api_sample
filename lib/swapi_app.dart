import 'package:flutter/material.dart';
import 'package:flutter_api_sample/pages/films/films_pageview.dart';
import 'package:flutter_api_sample/pages/people/people_pageview.dart';
import 'package:flutter_api_sample/pages/planets/planets_pageview.dart';
import 'package:flutter_api_sample/pages/vehicles/vehicles_pageview.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SwapiApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = useTabController(initialLength: 4);
    final _currentTabIndex = useState(0);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 2,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            const Text('SWAPI Miner', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 4),
            const Opacity(
              opacity: 0.4,
              child: Text(
                'may the force be with you',
                style: TextStyle(fontSize: 9),
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
        bottom: TabBar(
          controller: _controller,
          onTap: (index) {
            _currentTabIndex.value = index;
          },
          tabs: [
            Tab(icon: Icon(MdiIcons.movieRoll)),
            Tab(icon: Icon(MdiIcons.humanChild)),
            Tab(icon: Icon(MdiIcons.spaceStation)),
            Tab(icon: Icon(MdiIcons.googleEarth)),
          ],
        ),
      ),
      body: Center(
        child: TabBarView(
          controller: _controller,
          children: [
            FilmsPageView(),
            PeoplePageView(),
            VehiclesPageView(),
            PlanetsPageView(),
          ],
        ),
      ),
    );
  }
}
