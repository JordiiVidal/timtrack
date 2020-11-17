import 'package:equatable/equatable.dart';

class NavigationEvent extends Equatable {
  const NavigationEvent();
  @override
  List<Object> get props => [];
}

class NavigationLoaded extends NavigationEvent {}

class NavigationUpdated extends NavigationEvent {
  final int index;
  const NavigationUpdated(this.index);
  @override
  List<Object> get props => [index];
}
