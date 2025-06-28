import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {
  const BookState();
}

class BookLoading extends BookState {
  @override
  List<Object?> get props => [];
}

class BookLoaded extends BookState {
  @override
  List<Object?> get props => [];
}

class BookLoadingPagination extends BookState {
  @override
  List<Object?> get props => [];
}

class BookLoadedPagination extends BookState {
  @override
  List<Object?> get props => [];
}
