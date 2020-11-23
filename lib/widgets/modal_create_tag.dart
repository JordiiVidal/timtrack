import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/activity/activity.dart';
import 'package:timtrack/utils/helpers.dart';

class ModalCreateTag extends StatelessWidget {
  final Function addTag;

  ModalCreateTag({Key key, this.addTag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();
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
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: _textEditingController,
                    ),
                  ),
                  Container(
                    child: FlatButton(
                      color: Colors.black54,
                      onPressed: () {
                        BlocProvider.of<ActivityBloc>(context)
                            .add(ActivityAddTag(_textEditingController.text));
                        FocusScope.of(context).unfocus();
                        Navigator.pop(context);
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
