import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/people/people_details.dart';

class PeopleList extends StatelessWidget {
  const PeopleList(this.peoples);
  final List<PeopleModel> peoples;

  static void push(BuildContext context, List<PeopleModel> peoples) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PeopleList(peoples)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModalRoute.of(context).settings.name != '/'
          ? AppBar(
              title: Text('Characters'),
              centerTitle: false,
            )
          : null,
      body: ListView(
        children: ListTile.divideTiles(
                context: context,
                tiles: peoples
                    .map((people) => ListTile(
                          title: Text('${people.name}'),
                          subtitle: Text('${people.birthYear}'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PeopleDetails(people)));
                          },
                        ))
                    .toList())
            .toList(),
      ),
    );
  }
}
