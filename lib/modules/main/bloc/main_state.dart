import 'package:equatable/equatable.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainLoading extends MainState {
  final double progressCount;

  MainLoading({required this.progressCount});

  @override
  List<Object?> get props => [progressCount];
}

class MainLoaded extends MainState {
  @override
  List<Object?> get props => [];
}

class HomePageLoaded extends MainState {
  @override
  List<Object?> get props => [];
}

class FavoritePageLoaded extends MainState {
  @override
  List<Object?> get props => [];
}

class MainLoadToastInfo extends MainState {
  final bool status;
  final String message;

  MainLoadToastInfo({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
