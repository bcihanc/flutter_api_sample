import 'package:meta/meta.dart';

class FilmsPageModel {
  FilmsPageModel({
    @required this.count,
    @required this.next,
    @required this.previous,
    @required this.results,
  });

  final int count;
  final dynamic next;
  final dynamic previous;
  final List<FilmModel> results;

  factory FilmsPageModel.fromJson(Map<String, dynamic> json) => FilmsPageModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<FilmModel>.from(
            json["results"].map((x) => FilmModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class FilmModel {
  FilmModel({
    @required this.title,
    @required this.episodeId,
    @required this.openingCrawl,
    @required this.director,
    @required this.producer,
    @required this.releaseDate,
    @required this.characters,
    @required this.planets,
    @required this.starships,
    @required this.vehicles,
    @required this.species,
    @required this.created,
    @required this.edited,
    @required this.url,
  });

  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final DateTime releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        title: json["title"],
        episodeId: json["episode_id"],
        openingCrawl: json["opening_crawl"],
        director: json["director"],
        producer: json["producer"],
        releaseDate: DateTime.parse(json["release_date"]),
        characters: List<String>.from(json["characters"].map((x) => x)),
        planets: List<String>.from(json["planets"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "episode_id": episodeId,
        "opening_crawl": openingCrawl,
        "director": director,
        "producer": producer,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "planets": List<dynamic>.from(planets.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

class PeoplePageModel {
  PeoplePageModel({
    @required this.count,
    @required this.next,
    @required this.previous,
    @required this.results,
  });

  final int count;
  final String next;
  final String previous;
  final List<PeopleModel> results;

  factory PeoplePageModel.fromJson(Map<String, dynamic> json) =>
      PeoplePageModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PeopleModel>.from(
            json["results"].map((x) => PeopleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class PeopleModel {
  PeopleModel({
    @required this.name,
    @required this.height,
    @required this.mass,
    @required this.hairColor,
    @required this.skinColor,
    @required this.eyeColor,
    @required this.birthYear,
    @required this.gender,
    @required this.homeworld,
    @required this.films,
    @required this.species,
    @required this.vehicles,
    @required this.starships,
    @required this.created,
    @required this.edited,
    @required this.url,
  });

  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String> films;
  final List<dynamic> species;
  final List<String> vehicles;
  final List<String> starships;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: json["gender"],
        homeworld: json["homeworld"],
        films: List<String>.from(json["films"].map((x) => x)),
        species: List<dynamic>.from(json["species"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": gender,
        "homeworld": homeworld,
        "films": List<dynamic>.from(films.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "vehicles": List<dynamic>.from(vehicles.map((x) => x)),
        "starships": List<dynamic>.from(starships.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

class PlanetsPageModel {
  PlanetsPageModel({
    @required this.count,
    @required this.next,
    @required this.previous,
    @required this.results,
  });

  final int count;
  final String next;
  final dynamic previous;
  final List<PlanetModel> results;

  factory PlanetsPageModel.fromJson(Map<String, dynamic> json) =>
      PlanetsPageModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PlanetModel>.from(
            json["results"].map((x) => PlanetModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class PlanetModel {
  PlanetModel({
    @required this.name,
    @required this.rotationPeriod,
    @required this.orbitalPeriod,
    @required this.diameter,
    @required this.climate,
    @required this.gravity,
    @required this.terrain,
    @required this.surfaceWater,
    @required this.population,
    @required this.residents,
    @required this.films,
    @required this.created,
    @required this.edited,
    @required this.url,
  });

  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;
  final List<String> residents;
  final List<String> films;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory PlanetModel.fromJson(Map<String, dynamic> json) => PlanetModel(
        name: json["name"],
        rotationPeriod: json["rotation_period"],
        orbitalPeriod: json["orbital_period"],
        diameter: json["diameter"],
        climate: json["climate"],
        gravity: json["gravity"],
        terrain: json["terrain"],
        surfaceWater: json["surface_water"],
        population: json["population"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rotation_period": rotationPeriod,
        "orbital_period": orbitalPeriod,
        "diameter": diameter,
        "climate": climate,
        "gravity": gravity,
        "terrain": terrain,
        "surface_water": surfaceWater,
        "population": population,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "films": List<dynamic>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

class SpeciesModel {
  SpeciesModel({
    @required this.name,
    @required this.classification,
    @required this.designation,
    @required this.averageHeight,
    @required this.skinColors,
    @required this.hairColors,
    @required this.eyeColors,
    @required this.averageLifespan,
    @required this.homeworld,
    @required this.language,
    @required this.people,
    @required this.films,
    @required this.created,
    @required this.edited,
    @required this.url,
  });

  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final String skinColors;
  final String hairColors;
  final String eyeColors;
  final String averageLifespan;
  final String homeworld;
  final String language;
  final List<String> people;
  final List<String> films;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory SpeciesModel.fromJson(Map<String, dynamic> json) => SpeciesModel(
        name: json["name"],
        classification: json["classification"],
        designation: json["designation"],
        averageHeight: json["average_height"],
        skinColors: json["skin_colors"],
        hairColors: json["hair_colors"],
        eyeColors: json["eye_colors"],
        averageLifespan: json["average_lifespan"],
        homeworld: json["homeworld"],
        language: json["language"],
        people: List<String>.from(json["people"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "classification": classification,
        "designation": designation,
        "average_height": averageHeight,
        "skin_colors": skinColors,
        "hair_colors": hairColors,
        "eye_colors": eyeColors,
        "average_lifespan": averageLifespan,
        "homeworld": homeworld,
        "language": language,
        "people": List<String>.from(people.map((x) => x)),
        "films": List<String>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

class StarshipsModel {
  StarshipsModel({
    @required this.name,
    @required this.model,
    @required this.manufacturer,
    @required this.costInCredits,
    @required this.length,
    @required this.maxAtmospheringSpeed,
    @required this.crew,
    @required this.passengers,
    @required this.cargoCapacity,
    @required this.consumables,
    @required this.hyperdriveRating,
    @required this.mglt,
    @required this.starshipClass,
    @required this.pilots,
    @required this.films,
    @required this.created,
    @required this.edited,
    @required this.url,
  });

  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String hyperdriveRating;
  final String mglt;
  final String starshipClass;
  final List<String> pilots;
  final List<String> films;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory StarshipsModel.fromJson(Map<String, dynamic> json) => StarshipsModel(
        name: json["name"],
        model: json["model"],
        manufacturer: json["manufacturer"],
        costInCredits: json["cost_in_credits"],
        length: json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"],
        crew: json["crew"],
        passengers: json["passengers"],
        cargoCapacity: json["cargo_capacity"],
        consumables: json["consumables"],
        hyperdriveRating: json["hyperdrive_rating"],
        mglt: json["MGLT"],
        starshipClass: json["starship_class"],
        pilots: List<String>.from(json["pilots"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "model": model,
        "manufacturer": manufacturer,
        "cost_in_credits": costInCredits,
        "length": length,
        "max_atmosphering_speed": maxAtmospheringSpeed,
        "crew": crew,
        "passengers": passengers,
        "cargo_capacity": cargoCapacity,
        "consumables": consumables,
        "hyperdrive_rating": hyperdriveRating,
        "MGLT": mglt,
        "starship_class": starshipClass,
        "pilots": List<String>.from(pilots.map((x) => x)),
        "films": List<String>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

class VehiclesModel {
  VehiclesModel({
    @required this.name,
    @required this.model,
    @required this.manufacturer,
    @required this.costInCredits,
    @required this.length,
    @required this.maxAtmospheringSpeed,
    @required this.crew,
    @required this.passengers,
    @required this.cargoCapacity,
    @required this.consumables,
    @required this.vehicleClass,
    @required this.pilots,
    @required this.films,
    @required this.created,
    @required this.edited,
    @required this.url,
  });

  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String vehicleClass;
  final List<String> pilots;
  final List<String> films;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory VehiclesModel.fromJson(Map<String, dynamic> json) => VehiclesModel(
        name: json["name"],
        model: json["model"],
        manufacturer: json["manufacturer"],
        costInCredits: json["cost_in_credits"],
        length: json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"],
        crew: json["crew"],
        passengers: json["passengers"],
        cargoCapacity: json["cargo_capacity"],
        consumables: json["consumables"],
        vehicleClass: json["vehicle_class"],
        pilots: List<String>.from(json["pilots"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "model": model,
        "manufacturer": manufacturer,
        "cost_in_credits": costInCredits,
        "length": length,
        "max_atmosphering_speed": maxAtmospheringSpeed,
        "crew": crew,
        "passengers": passengers,
        "cargo_capacity": cargoCapacity,
        "consumables": consumables,
        "vehicle_class": vehicleClass,
        "pilots": List<String>.from(pilots.map((x) => x)),
        "films": List<String>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

class VehiclesPageModel {
  VehiclesPageModel({
    @required this.count,
    @required this.next,
    @required this.previous,
    @required this.results,
  });

  final int count;
  final String next;
  final dynamic previous;
  final List<VehicleModel> results;

  factory VehiclesPageModel.fromJson(Map<String, dynamic> json) =>
      VehiclesPageModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<VehicleModel>.from(
            json["results"].map((x) => VehicleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class VehicleModel {
  VehicleModel({
    @required this.name,
    @required this.model,
    @required this.manufacturer,
    @required this.costInCredits,
    @required this.length,
    @required this.maxAtmospheringSpeed,
    @required this.crew,
    @required this.passengers,
    @required this.cargoCapacity,
    @required this.consumables,
    @required this.vehicleClass,
    @required this.pilots,
    @required this.films,
    @required this.created,
    @required this.edited,
    @required this.url,
  });

  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String vehicleClass;
  final List<String> pilots;
  final List<String> films;
  final DateTime created;
  final DateTime edited;
  final String url;

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        name: json["name"],
        model: json["model"],
        manufacturer: json["manufacturer"],
        costInCredits: json["cost_in_credits"],
        length: json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"],
        crew: json["crew"],
        passengers: json["passengers"],
        cargoCapacity: json["cargo_capacity"],
        consumables: json["consumables"],
        vehicleClass: json["vehicle_class"],
        pilots: List<String>.from(json["pilots"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "model": model,
        "manufacturer": manufacturer,
        "cost_in_credits": costInCredits,
        "length": length,
        "max_atmosphering_speed": maxAtmospheringSpeed,
        "crew": crew,
        "passengers": passengers,
        "cargo_capacity": cargoCapacity,
        "consumables": consumables,
        "vehicle_class": vehicleClass,
        "pilots": List<String>.from(pilots.map((x) => x)),
        "films": List<String>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}
