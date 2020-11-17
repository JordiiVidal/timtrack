import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/models/activity_model.dart';

class CreateActivity extends StatelessWidget {
  const CreateActivity({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(18),
              child: Text('Create Activity'),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              child: TextField(
                controller: _textEditingController,
              ),
            ),
          ),
          Container(
            child: RaisedButton(
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
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
