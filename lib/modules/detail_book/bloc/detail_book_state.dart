import 'package:equatable/equatable.dart';

abstract class DetailBookState extends Equatable {
  const DetailBookState();
}

class DetailBookLoading extends DetailBookState {
  @override
  List<Object?> get props => [];
}

class DetailBookLoaded extends DetailBookState {
  @override
  List<Object?> get props => [];
}

class DetailBookAddedFavorite extends DetailBookState {
  final bool isFavorite;

  DetailBookAddedFavorite({required this.isFavorite});

  @override
  List<Object?> get props => [isFavorite];
}
