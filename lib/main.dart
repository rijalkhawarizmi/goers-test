import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goers_test/core/services/injection_container.dart';
import 'package:goers_test/species/presentation/bloc/species_bloc.dart';
import 'package:goers_test/species/presentation/pages/species_page.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => sl<SpeciesBloc>())],

      child: MaterialApp(home: SpeciesPage()),
    );
  }
}
