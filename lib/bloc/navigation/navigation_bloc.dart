import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/navigation/navigation.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationLoadInProgress());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigationLoaded) {
      yield* _mapNavigationLoadedToState(); //init
    } else if (event is NavigationUpdated) {
      yield* _mapNavigationUpdatedToState(event);
    }
  }

  Stream<NavigationState> _mapNavigationLoadedToState() async* {
    try {
      yield NavigationLoadSuccess(1);
    } catch (_) {
      yield NavigationLoadFailure();
    }
  }

  Stream<NavigationState> _mapNavigationUpdatedToState(
      NavigationUpdated event) async* {
    if (state is NavigationLoadSuccess) {
      yield NavigationLoadSuccess(event.index);
    }
  }
}
