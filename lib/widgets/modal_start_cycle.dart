import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/cycle_model.dart';
import 'package:timtrack/utils/helpers.dart';
import 'package:timtrack/widgets/chips_state_cycle.dart';

class ModalStartCycle extends StatelessWidget {
  final Activity activity;

  const ModalStartCycle({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  ChipsStateCycle(),
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
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: Text(
                        'Create',
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
