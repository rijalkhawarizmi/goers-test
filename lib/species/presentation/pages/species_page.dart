import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goers_test/species/presentation/pages/detail_species.dart';
import 'package:goers_test/species/presentation/widget/detail_row_widget.dart';

import '../../../core/utils/format_date.dart';
import '../bloc/species_bloc.dart';

class SpeciesPage extends StatefulWidget {
  const SpeciesPage({super.key});

  @override
  State<SpeciesPage> createState() => _SpeciesPageState();
}

class _SpeciesPageState extends State<SpeciesPage> {
  final _scrollController = ScrollController();
 
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SpeciesBloc>().add(SpeciesEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: RefreshIndicator(
        onRefresh: () async => {
          context.read<SpeciesBloc>().add(SpeciesEvent(isRefresh: true))
        },
        child: BlocBuilder<SpeciesBloc, SpeciesState>(
          builder: (context, state) {
            switch (state.status) {
              case SpeciesStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case SpeciesStatus.failure:
                return Center(child: Text(state.message));
              case SpeciesStatus.success:
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        controller: _scrollController,
                        itemCount:
                            state.hasReachMax
                                ? state.speciesEntity.length
                                : state.speciesEntity.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          return index >= state.speciesEntity.length
                              ? const Center(child: CircularProgressIndicator())
                              : InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (c){
                                    return DetailSpecies(species: state.speciesEntity[index]);
                                  }));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DetailRowWidget(
                                            label: 'Classification',
                                            value: state.speciesEntity[index].fields?.classification ?? "-"
                                          ),
                                          DetailRowWidget(
                                            label: 'Designation',
                                            value: state.speciesEntity[index].fields?.designation ?? "-" 
                                          ),
                                          DetailRowWidget(
                                            label: 'Average Lifespan',
                                            value: state.speciesEntity[index].fields?.averageLifespan ?? "-"
                                          ),
                                          DetailRowWidget(
                                            label: 'Average Height',
                                            value: state.speciesEntity[index].fields?.averageHeight ?? "-"
                                          ),
                                          DetailRowWidget(
                                            label: 'Eye Colors',
                                            value: state.speciesEntity[index].fields?.eyeColors ?? "-"
                                          ),
                                          DetailRowWidget(
                                            label: 'Skin Colors',
                                            value: state.speciesEntity[index].fields?.skinColors ?? "-"
                                          ),
                                          DetailRowWidget(
                                            label: 'Hair Colors',
                                            value: state.speciesEntity[index].fields?.hairColors ?? "-"
                                          ),
                                          DetailRowWidget(
                                            label: 'Language',
                                            value: state.speciesEntity[index].fields?.language ?? "-"
                                          ),
                                          DetailRowWidget(
                                            label: 'Created',
                                            value: formatDate(state.speciesEntity[index].fields?.created?.toIso8601String()),
                                          ),
                                          DetailRowWidget(
                                            label: 'Edited',
                                            value: formatDate(state.speciesEntity[index].fields?.edited?.toIso8601String()),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                        },
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<SpeciesBloc>().add(const SpeciesEvent());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

