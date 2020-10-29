import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:timtrack/data/list.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivitiesGridSign extends StatefulWidget {
  const ActivitiesGridSign({Key key}) : super(key: key);

  @override
  _ActivitiesGridSignState createState() => _ActivitiesGridSignState();
}

class _ActivitiesGridSignState extends State<ActivitiesGridSign> {
  List activitiesSelected = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            duration: const Duration(milliseconds: 500),
            columnCount: 4,
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: itemActivity(
                  activities[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemActivity(Activity activity) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          (activitiesSelected.contains(activity.id))
              ? activitiesSelected.remove(activity.id)
              : activitiesSelected.add(activity.id);
        })
      },
      child: Container(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                maxRadius: activitiesSelected.contains(activity.id) ? 30 : 23,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${activity.name}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
