import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/bloc/navigation/navigation.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityCreate extends StatefulWidget {
  @override
  _ActivityCreateState createState() => _ActivityCreateState();
}

class _ActivityCreateState extends State<ActivityCreate> {
  final GlobalKey _globalKey = new GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();
  Color currentColor = Colors.black;

  void changeColor(Color color) => setState(() => currentColor = color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
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
                    Container(
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
                            color: Colors.grey[600]),
                      ),
                    ),
                    Container(
                      child: TextField(
                        controller: _textEditingController,
                        key: _globalKey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 35,
          // ),
          // Container(
          //   child: Text(
          //     'Tags',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 18,
          //       color: Colors.grey[600],
          //     ),
          //   ),
          // ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              color: Colors.white,
              child: Text('Create'),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                BlocProvider.of<ActivitiesBloc>(context).add(
                  ActivityAdded(
                    Activity(
                      name: _textEditingController.text,
                      totalCycles: 0,
                      color: currentColor,
                      deleted: false,
                    ),
                  ),
                );
                BlocProvider.of<NavigationBloc>(context).add(
                  NavigationUpdated(0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
