import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:timtrack/bloc/activity/activity_bloc.dart';

import 'package:timtrack/widgets/signup/activity_circle_sign.dart';

class ActivitiesGridSign extends StatefulWidget {
  @override
  _ActivitiesGridSignState createState() => _ActivitiesGridSignState();
}

class _ActivitiesGridSignState extends State<ActivitiesGridSign> {
  ActivityBloc activityBloc;

  @override
  void initState() {
    super.initState();
    activityBloc = BlocProvider.of<ActivityBloc>(context);
    activityBloc.add(GetActivities());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (_, state) {
        if (state.list.isEmpty) {
          return Container();
        }
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: AnimationLimiter(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              shrinkWrap: true,
              staggeredTileBuilder: (_) => StaggeredTile.fit(1),
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              physics: BouncingScrollPhysics(),
              itemCount: state.list.length,
              itemBuilder: (BuildContext context, int index) =>
                  AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 200),
                columnCount: 4,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: ActivityCircle(
                      activity: state.list[index],
                      state: state,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
