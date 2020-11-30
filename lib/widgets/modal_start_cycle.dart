import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:timtrack/bloc/cycles/cycles.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/cycle_model.dart';
import 'package:timtrack/utils/helpers.dart';

class ModalStartCycle extends StatefulWidget {
  final Activity activity;

  const ModalStartCycle({Key key, @required this.activity}) : super(key: key);

  @override
  _ModalStartCycleState createState() => _ModalStartCycleState();
}

class _ModalStartCycleState extends State<ModalStartCycle> {
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  List<String> activeTags;

  @override
  void initState() {
    super.initState();
    activeTags = [];
  }

  void onTapTag(String tag) {
    setState(() {
      if (isActive(tag)) {
        activeTags.remove(tag);
      } else {
        activeTags.add(tag);
      }
    });
  }

  bool isActive(String tag) {
    return (activeTags.contains(tag)) ? true : false;
  }

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
                      widget.activity.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('Choose tags of this activity'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16.0),
                    child: Tags(
                      key: _tagStateKey,
                      spacing: 12,
                      alignment: WrapAlignment.start,
                      itemCount: widget.activity.tags.length, // required
                      itemBuilder: (int index) {
                        final String tag = widget.activity.tags[index];
                        return ItemTags(
                          key: Key('$index'),
                          index: index, // required
                          title: tag,
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          textStyle: TextStyle(fontSize: 15),
                          pressEnabled: true,
                          active: isActive(tag),
                          combine: ItemTagsCombine.withTextBefore,
                          removeButton: null,
                          onPressed: (item) {
                            onTapTag(tag);
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      color: Colors.black54,
                      onPressed: () {
                        BlocProvider.of<CyclesBloc>(context).add(
                          CycleAdded(
                            Cycle(
                              activity: widget.activity,
                              dateStart:
                                  new DateTime.now().millisecondsSinceEpoch,
                              dateEnd: null,
                              status: StatusCycle.ongoing,
                              tags: activeTags,
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      
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
