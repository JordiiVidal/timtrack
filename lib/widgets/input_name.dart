import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/user/user_bloc.dart';

class InputName extends StatelessWidget {
  const InputName({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      height: 100,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Color(0xff6d60f8),
              ),
              color: Colors.white,
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Name User',
              ),
              onChanged: (txt) => {
                BlocProvider.of<UserBloc>(context).add(
                  ChangeName(txt),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
