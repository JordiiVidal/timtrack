import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/widgets/modal_create_tag.dart';

class FormActivity extends StatefulWidget {
  const FormActivity({Key key}) : super(key: key);

  @override
  _FormActivityState createState() => _FormActivityState();
}

class _FormActivityState extends State<FormActivity> {
  final GlobalKey _globalKey = new GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

  Color currentColor;
  List<String> tags;

  @override
  void initState() {
    super.initState();
    currentColor = Colors.grey[700];
    tags = [];
  }

  void _changeColor(Color color) {
    setState(() {
      currentColor = color;
    });
  }

  void _addTag(String tag) {
    if (!tags.contains(tag)) {
      setState(() {
        tags.add(tag);
      });
    }
  }

  void _deleteTag(int index) {
    setState(() {
      tags.removeAt(index);
    });
  }

  void createActivity() {
    Activity activity = Activity(
      name: _textEditingController.text,
      color: currentColor,
      tags: tags,
      deleted: false,
    );
    FocusScope.of(context).unfocus();
    BlocProvider.of<ActivitiesBloc>(context).add(ActivityAdded(activity));
   
  }

  @override
  Widget build(BuildContext context) {
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
                                  onColorChanged: _changeColor,
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
                        color: Colors.grey[600],
                      ),
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
        SizedBox(
          height: 35,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tags',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  showBarModalBottomSheet(
                    expand: true,
                    duration: Duration(milliseconds: 600),
                    context: context,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    topControl: Container(
                      height: 300,
                    ),
                    builder: (context) => ModalCreateTag(
                      addTag: _addTag,
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Tags(
          key: _tagStateKey,
          spacing: 12,
          alignment: WrapAlignment.start,
          itemCount: tags.length, // required
          itemBuilder: (int index) {
            final String tag = tags[index];
            return ItemTags(
              key: Key('$index'),
              index: index, // required
              title: tag,
              active: true,
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              textStyle: TextStyle(fontSize: 15),
              pressEnabled: true,
              combine: ItemTagsCombine.withTextBefore,
              removeButton: ItemTagsRemoveButton(
                margin: const EdgeInsets.only(left: 10.0),
                color: Colors.grey[800],
                backgroundColor: Colors.grey[200],
                size: 14,
                onRemoved: () {
                  _deleteTag(index);
                  return false;
                },
              ),
              onPressed: (item) => _deleteTag(index),
              // OR null,
            );
          },
        ),
        SizedBox(height: 20),
        Align(
          alignment: Alignment.bottomRight,
          child: RaisedButton(
            color: Colors.white,
            child: Text('Create'),
            onPressed: createActivity,
          ),
        ),
      ],
    );
  }
}
