import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ActivityEvent extends Equatable {
  const ActivityEvent();
  @override
  List<Object> get props => [];
}

class ActivityLoaded extends ActivityEvent {}

class ActivityChangeColor extends ActivityEvent {
  final Color color;

  ActivityChangeColor(this.color);

  @override
  List<Object> get props => [color];
}

class ActivityChangeName extends ActivityEvent {
  final String name;

  ActivityChangeName(this.name);

  @override
  List<Object> get props => [name];
}

class ActivityChangeTags extends ActivityEvent {
  final List<String> tags;

  ActivityChangeTags(this.tags);

  @override
  List<Object> get props => [tags];
}

class ActivityAddTag extends ActivityEvent {
  final String tag;

  ActivityAddTag(this.tag);

  @override
  List<Object> get props => [tag];
}


class ActivityDeleteTag extends ActivityEvent {
  final int index;

  ActivityDeleteTag(this.index);

  @override
  List<Object> get props => [index];
}

class ActivityCreated extends ActivityEvent {}
