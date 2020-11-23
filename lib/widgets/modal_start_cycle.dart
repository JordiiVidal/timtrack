import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:timtrack/bloc/cycles/cycles.dart';
import 'package:timtrack/bloc/navigation/navigation.dart';
import 'package:timtrack/bloc/navigation/navigation_bloc.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/cycle_model.dart';
import 'package:timtrack/utils/helpers.dart';

class ModalStartCycle extends StatelessWidget {
  final Activity activity;

  const ModalStartCycle({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

    return Container(
      child: Material(
        child: CupertinoPageScaffold(
          child: SafeArea(
            bottom: false,
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  modalBar(),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      activity.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Tags(
                    key: _tagStateKey,
                    spacing: 12,
                    alignment: WrapAlignment.start,
                    itemCount: activity.tags.length, // required
                    itemBuilder: (int index) {
                      final String tag = activity.tags[index];
                      return ItemTags(
                        key: Key('$index'),
                        index: index, // required
                        title: tag,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        textStyle: TextStyle(fontSize: 15),
                        pressEnabled: true,
                        combine: ItemTagsCombine.withTextBefore,
                        removeButton: null,
                        onPressed: (item) => print(item),
                        // OR null,
                      );
                    },
                  ),
                  Container(
                    child: FlatButton(
                      color: Colors.black54,
                      onPressed: () {
                        BlocProvider.of<CyclesBloc>(context).add(
                          CycleAdded(
                            Cycle(
                              activity: activity,
                              dateStart:
                                  new DateTime.now().millisecondsSinceEpoch,
                              dateEnd: null,
                              status: StatusCycle.ongoing,
                            ),
                          ),
                        );
                        Navigator.pop(context);
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationUpdated(1));
                      },
                      child: Text(
                        'START',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
