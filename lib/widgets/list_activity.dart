import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/widgets/activity_item.dart';
import 'package:timtrack/widgets/empty_list.dart';

class ListActivity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
        builder: (context, state) {
          if (state is ActivitiesLoadInProgress) {
            return Container(
              child: CircularProgressIndicator(),
              width: 40,
              height: 40,
            );
          } else if (state is ActivitiesLoadSuccess) {
            final List<Activity> list = state.activities;
            if (list.isEmpty)
              return EmptyList(
                asset: 'assets/empty_list.png',
                text: 'Empty',
              );
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (c, i) => ActivityItem(
                activity: list[i],
              ),
            );
          } else {
            return Container(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
