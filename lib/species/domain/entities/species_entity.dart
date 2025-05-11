// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SpeciesEntity extends Equatable {
    final FieldsEntity? fields;

    const SpeciesEntity({
        this.fields,
    });


  @override
  List<Object?> get props => [fields];
}

class FieldsEntity extends Equatable {
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

    const FieldsEntity({
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


  @override
  List<Object?> get props {
    return [
      edited,
      classification,
      name,
      designation,
      created,
      eyeColors,
      people,
      skinColors,
      language,
      hairColors,
      homeworld,
      averageLifespan,
      averageHeight,
      url,
    ];
  }
}
