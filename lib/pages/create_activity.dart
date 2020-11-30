import 'package:flutter/material.dart';
import 'package:timtrack/widgets/form_activity.dart';

class CreateActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: FormActivity(),
    );
  }
}
