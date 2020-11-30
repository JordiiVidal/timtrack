import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/data/data.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/utils/helpers.dart';
import 'package:timtrack/widgets/activity_item.dart';
import 'package:timtrack/widgets/empty_list.dart';

class ListActivity extends StatelessWidget {
  final ScrollController sc;
  const ListActivity({Key key, this.sc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              child: Center(
                child: modalBar(),
              ),
            ),
          ),
          BlocBuilder<ActivitiesBloc, ActivitiesState>(
            builder: (context, state) {
              if (state is ActivitiesLoadInProgress) {
                return Container(
                  child: CircularProgressIndicator(),
                  width: 40,
                  height: 40,
                );
              } else if (state is ActivitiesLoadSuccess) {
                final List<Activity> list = activities;
                if (list.isEmpty) {
                  return EmptyList(
                    asset: 'assets/empty_list.png',
                    text: 'Empty',
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 15),
                  child: ListView.builder(
                    controller: sc,
                    itemCount: list.length,
                    itemBuilder: (c, i) => ActivityItem(
                      activity: list[i],
                    ),
                  ),
                );
              } else {
                return Container(
                  child: Text('Error'),
                );
              }
            },
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () => Navigator.pushNamed(context, "/addActivity"),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
