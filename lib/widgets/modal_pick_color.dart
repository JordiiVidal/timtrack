import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:timtrack/utils/helpers.dart';

class ModalPickColor extends StatefulWidget {
  const ModalPickColor({Key key}) : super(key: key);

  @override
  _ModalPickColorState createState() => _ModalPickColorState();
}

class _ModalPickColorState extends State<ModalPickColor> {
  Color _currentColor = Colors.blue;
  void _onColorChanged(Color color) {
    print(color);
    setState(() => _currentColor = color);
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
                  Center(
                    child: Container(
                      child: CircleColorPicker(
                        initialColor: _currentColor,
                        onChanged: _onColorChanged,
                        size: const Size(240, 240),
                        strokeWidth: 4,
                        thumbSize: 36,
                      ),
                    ),
                  ),
                  Container(
                    child: RaisedButton(
                      child: Text('Create'),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
