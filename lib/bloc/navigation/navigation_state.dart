import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationLoadInProgress extends NavigationState {}

class NavigationLoadFailure extends NavigationState {}

class NavigationLoadSuccess extends NavigationState {
  final int index;

  const NavigationLoadSuccess([this.index = 1]);

  @override
  List<Object> get props => [index];
}
