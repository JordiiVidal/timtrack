import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/bloc/activity/activity.dart';
import 'package:timtrack/bloc/navigation/navigation.dart';
import 'package:timtrack/widgets/activity_tags.dart';

class FormActivity extends StatelessWidget {
  const FormActivity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey _globalKey = new GlobalKey();
    final TextEditingController _textEditingController =
        TextEditingController();
    void changeColor(Color color) =>
        BlocProvider.of<ActivityBloc>(context).add(ActivityChangeColor(color));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      'Color',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  BlocBuilder<ActivityBloc, ActivityState>(
                    builder: (context, state) {
                      final Color currentColor = (state is ActivityLoadSuccess)
                          ? state.activity.color
                          : Colors.grey[600];
                      return Container(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: const EdgeInsets.all(0.0),
                                  contentPadding: const EdgeInsets.all(0.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  content: SingleChildScrollView(
                                    child: SlidePicker(
                                      pickerColor: currentColor,
                                      onColorChanged: changeColor,
                                      paletteType: PaletteType.rgb,
                                      enableAlpha: false,
                                      displayThumbColor: true,
                                      showLabel: false,
                                      showIndicator: true,
                                      indicatorBorderRadius:
                                          const BorderRadius.vertical(
                                        top: const Radius.circular(25.0),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: currentColor,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Activity Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Container(
                    child: TextField(
                      controller: _textEditingController,
                      key: _globalKey,
                      onChanged: (text) =>
                          BlocProvider.of<ActivityBloc>(context)
                              .add(ActivityChangeName(text)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 35,
        ),
        ActivityTags(),
        SizedBox(height: 20),
        BlocBuilder<ActivityBloc, ActivityState>(
          builder: (context, state) {
            if (state is ActivityLoadSuccess) {
              return Align(
                alignment: Alignment.bottomRight,
                child: RaisedButton(
                  color: Colors.white,
                  child: Text('Create'),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    BlocProvider.of<ActivitiesBloc>(context)
                        .add(ActivityAdded(state.activity));
                    BlocProvider.of<NavigationBloc>(context).add(
                      NavigationUpdated(0),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
