// To parse this JSON data, do
//
//     final speciesModel = speciesModelFromJson(jsonString);

import 'dart:convert';

import 'package:goers_test/species/domain/entities/species_entity.dart';

SpeciesModel speciesModelFromJson(String str) => SpeciesModel.fromJson(json.decode(str));

String speciesModelToJson(SpeciesModel data) => json.encode(data.toJson());

class SpeciesModel extends SpeciesEntity {
    final FieldsModel? fields;

    SpeciesModel({
        this.fields,
    }):super(fields: fields);

    factory SpeciesModel.fromJson(Map<String, dynamic> json) => SpeciesModel(
        fields: json["fields"] == null ? null : FieldsModel.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "fields": fields?.toJson(),
    };
}

class FieldsModel extends FieldsEntity {
    final DateTime? edited;
    final String? classification;
    final String? name;
    final String? designation;
    final DateTime? created;
    final String? eyeColors;
    final List<String>? people;
    final String? skinColors;
    final String? language;
    final String? hairColors;
    final String? homeworld;
    final String? averageLifespan;
    final String? averageHeight;
    final String? url;

    FieldsModel({
        this.edited,
        this.classification,
        this.name,
        this.designation,
        this.created,
        this.eyeColors,
        this.people,
        this.skinColors,
        this.language,
        this.hairColors,
        this.homeworld,
        this.averageLifespan,
        this.averageHeight,
        this.url,
    });

    factory FieldsModel.fromJson(Map<String, dynamic> json) => FieldsModel(
        edited: json["edited"] == null ? null : DateTime.parse(json["edited"]),
        classification: json["classification"],
        name: json["name"],
        designation: json["designation"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        eyeColors: json["eye_colors"],
        people: json["people"] == null ? [] : List<String>.from(json["people"]!.map((x) => x)),
        skinColors: json["skin_colors"],
        language: json["language"],
        hairColors: json["hair_colors"],
        homeworld: json["homeworld"],
        averageLifespan: json["average_lifespan"],
        averageHeight: json["average_height"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "edited": edited?.toIso8601String(),
        "classification": classification,
        "name": name,
        "designation": designation,
        "created": created?.toIso8601String(),
        "eye_colors": eyeColors,
        "people": people == null ? [] : List<dynamic>.from(people!.map((x) => x)),
        "skin_colors": skinColors,
        "language": language,
        "hair_colors": hairColors,
        "homeworld": homeworld,
        "average_lifespan": averageLifespan,
        "average_height": averageHeight,
        "url": url,
    };
}
