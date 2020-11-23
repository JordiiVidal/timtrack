import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/activity/activity.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityLoadInProgress());

  @override
  Stream<ActivityState> mapEventToState(event) async* {
    if (event is ActivityLoaded) {
      yield* _mapActivityLoadedToState(event);
    } else if (event is ActivityChangeColor) {
      yield* _mapActivityChangeColorToState(event);
    } else if (event is ActivityChangeName) {
      yield* _mapActivityChangeNameToState(event);
    } else if (event is ActivityChangeTags) {
      yield* _mapActivityChangeTagsToState(event);
    } else if (event is ActivityAddTag) {
      yield* _mapActivityAddTagToState(event);
    }else if (event is ActivityDeleteTag) {
      yield* _mapActivityDeleteTagToState(event);
    }
  }

  Stream<ActivityState> _mapActivityLoadedToState(ActivityLoaded event) async* {
    try {
      final Activity activity = Activity(name: '');
      yield ActivityLoadSuccess(activity);
    } catch (_) {
      yield ActivityLoadFailure();
    }
  }

  Stream<ActivityState> _mapActivityChangeColorToState(
      ActivityChangeColor event) async* {
    if (state is ActivityLoadSuccess) {
      ActivityLoadSuccess states = state;
      yield ActivityLoadSuccess(states.activity.copyWith(color: event.color));
    }
  }

  Stream<ActivityState> _mapActivityChangeNameToState(
      ActivityChangeName event) async* {
    if (state is ActivityLoadSuccess) {
      ActivityLoadSuccess states = state;
      yield ActivityLoadSuccess(states.activity.copyWith(name: event.name));
    }
  }

  Stream<ActivityState> _mapActivityChangeTagsToState(
      ActivityChangeTags event) async* {
    if (state is ActivityLoadSuccess) {
      ActivityLoadSuccess states = state;
      yield ActivityLoadSuccess(states.activity.copyWith(tags: event.tags));
    }
  }

  Stream<ActivityState> _mapActivityAddTagToState(ActivityAddTag event) async* {
    if (state is ActivityLoadSuccess) {
      ActivityLoadSuccess states = state;
      final List<String> tags = states.activity.tags;
      tags.add(event.tag);
      yield ActivityLoadSuccess(states.activity.copyWith(tags: tags));
    }
  }

   Stream<ActivityState> _mapActivityDeleteTagToState(ActivityDeleteTag event) async* {
    if (state is ActivityLoadSuccess) {
      ActivityLoadSuccess states = state;
      final List<String> tags = states.activity.tags;
      tags.removeAt(event.index);
      yield ActivityLoadSuccess(states.activity.copyWith(tags: tags));
    }
  }
}
