import 'package:equatable/equatable.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

class FavoriteLoading extends FavoriteState {
  @override
  List<Object?> get props => [];
}

class FavoriteLoaded extends FavoriteState {
  @override
  List<Object?> get props => [];
}
