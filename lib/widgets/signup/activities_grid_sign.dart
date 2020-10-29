import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:timtrack/bloc/user/user_bloc.dart';
import 'package:timtrack/data/list.dart';
import 'package:timtrack/widgets/signup/activity_circle_sign.dart';

class ActivitiesGridSign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (_, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: AnimationLimiter(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              physics: BouncingScrollPhysics(),
              itemCount: activities.length,
              itemBuilder: (BuildContext context, int index) =>
                  AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 200),
                columnCount: 4,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: ActivityCircle(
                      activity: activities[index],
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
