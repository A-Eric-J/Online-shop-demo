import 'package:equatable/equatable.dart';
import 'package:pixelfield_test_app/models/wine/wine.dart';

abstract class WineState extends Equatable {
  const WineState();

  @override
  List<Object> get props => [];
}

class WineInitial extends WineState {}

class WineLoading extends WineState {}

class WineLoaded extends WineState {
  final List<Wine> wines;

  const WineLoaded(this.wines);

  @override
  List<Object> get props => [wines];
}

class WineError extends WineState {
  final String message;

  const WineError(this.message);

  @override
  List<Object> get props => [message];
}
