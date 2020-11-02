import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timtrack/bloc/activity/activity_bloc.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/widgets/activity_listtile.dart';

class AddActivityPage extends StatelessWidget {
  const AddActivityPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    // ignore: close_sinks
    ActivityBloc activityBloc = BlocProvider.of<ActivityBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('ACTIVITY'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  child: TextField(
                    controller: _textEditingController,
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text('+ Add'),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      activityBloc.add(
                        AddActivity(
                          Activity(
                            name: _textEditingController.text,
                            deleted: false,
                            active: false,
                            duration: 1,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
            child: BlocBuilder<ActivityBloc, ActivityState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (c, i) =>
                      ActivityListTile(activity: state.list[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
