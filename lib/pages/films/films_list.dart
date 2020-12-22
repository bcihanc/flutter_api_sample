import 'package:flutter/material.dart';
import 'package:flutter_api_sample/models/SwapiModels.dart';
import 'package:flutter_api_sample/pages/films/film_details.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';

class FilmsList extends HookWidget {
  const FilmsList(this.films);
  final List<FilmModel> films;

  static void push(BuildContext context, List<FilmModel> films) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FilmsList(films)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ModalRoute.of(context).settings.name == '/'
          ? null
          : AppBar(
              centerTitle: false,
              title: Text('Planets'),
            ),
      body: ListView(
        children: ListTile.divideTiles(
                context: context,
                tiles: films.map((film) {
                  void _handleOnTap() => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FilmDetails(film)));

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      dense: true,
                      leading: Text(
                        '${film.releaseDate.year}',
                        style: GoogleFonts.montserrat(),
                      ),
                      onTap: _handleOnTap,
                      title:
                          Text('${film.title}', style: TextStyle(fontSize: 16)),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      subtitle: Opacity(
                        opacity: 0.5,
                        child: Text(
                            '${film.openingCrawl.replaceAll('\r\n', ' ')}',
                            maxLines: 1),
                      ),
                    ),
                  );
                }).toList())
            .toList(),
      ),
    );
  }
}
