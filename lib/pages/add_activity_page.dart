import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/models/activity_model.dart';

class AddActivityPage extends StatelessWidget {
  const AddActivityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    // ignore: close_sinks

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Activity'),
      ),
      body: Column(
        children: [
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
              onPressed: () {
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
