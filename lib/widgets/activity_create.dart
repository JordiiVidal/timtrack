import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/bloc/navigation/navigation.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/widgets/modal_pick_color.dart';

class ActivityCreate extends StatelessWidget {
  final GlobalKey _globalKey = new GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();

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
                          showBarModalBottomSheet(
                            expand: true,
                            duration: Duration(milliseconds: 600),
                            context: context,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            topControl: Container(
                              height: 150,
                            ),
                            builder: (context) => ModalPickColor(),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(0xff303030),
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
          SizedBox(
            height: 35,
          ),
          Container(
            child: Text(
              'Tags',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ),
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
                      deleted: false,
                    ),
                  ),
                );
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationUpdated(2));
              },
            ),
          ),
        ],
      ),
    );
  }
}
