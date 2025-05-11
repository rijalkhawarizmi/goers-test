import 'package:flutter/material.dart';
import 'package:goers_test/species/domain/entities/species_entity.dart';
import 'package:goers_test/species/presentation/widget/detail_row_widget.dart';

import '../../../core/utils/format_date.dart';

class DetailSpecies extends StatelessWidget {
  const DetailSpecies({super.key, required this.species});
  final SpeciesEntity species;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailRowWidget(
                  label: 'Classification',
                  value: species.fields?.classification ?? "-",
                ),
                DetailRowWidget(
                  label: 'Designation',
                  value: species.fields?.designation ?? "-",
                ),
                DetailRowWidget(
                  label: 'Average Lifespan',
                  value: species.fields?.averageLifespan ?? "-",
                ),
                DetailRowWidget(
                  label: 'Average Height',
                  value: species.fields?.averageHeight ?? "-",
                ),
                DetailRowWidget(
                  label: 'Eye Colors',
                  value: species.fields?.eyeColors ?? "-",
                ),
                DetailRowWidget(
                  label: 'Skin Colors',
                  value: species.fields?.skinColors ?? "-",
                ),
                DetailRowWidget(
                  label: 'Hair Colors',
                  value: species.fields?.hairColors ?? "-",
                ),
                DetailRowWidget(
                  label: 'Language',
                  value: species.fields?.language ?? "-",
                ),
                DetailRowWidget(
                  label: 'Created',
                  value: formatDate(species.fields?.created?.toIso8601String()),
                ),
                DetailRowWidget(
                  label: 'Edited',
                  value: formatDate(species.fields?.edited?.toIso8601String()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
