part of 'species_bloc.dart';

class SpeciesEvent extends Equatable {
  const SpeciesEvent({this.isRefresh=false});
  final bool isRefresh;

  @override
  List<Object> get props => [isRefresh];
}
