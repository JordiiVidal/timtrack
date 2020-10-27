import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:timtrack/bloc/user/user_bloc.dart';
import 'package:timtrack/data/list.dart';

import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/user_model.dart';
import 'package:timtrack/widgets/signup_background.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SignUpBackground(
            size: size,
          ),
          formLogic(context, size),
        ],
      ),
    );
  }

  Widget formLogic(BuildContext context, Size size) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.0),
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
                      controller: myController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'example@mail.com',
                        labelText: 'Name',
                        icon: Icon(
                          Icons.person_outline,
                          color: Color.fromRGBO(63, 63, 156, 1.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: AnimationLimiter(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                        physics: BouncingScrollPhysics(),
                        itemCount: activities.length,
                        itemBuilder: (BuildContext context, int index) =>
                            AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          columnCount: 4,
                          child: ScaleAnimation(
                            child: FadeInAnimation(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        child: CircleAvatar(),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '${activities[index].name}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: size.width * 0.15,
                    right: size.width * 0.15,
                    child: buttonSignUp(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  RaisedButton buttonSignUp(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: EdgeInsets.all(0),
      elevation: 0.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff6d60f8),
            ),
            height: 50,
            child: Row(
              children: <Widget>[
                Text(
                  'Start',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(
                  Icons.chevron_right,
                  size: 30,
                  color: Color(0xff6d60f8),
                ),
              ),
            ),
          )
        ],
      ),
      onPressed: () {
        BlocProvider.of<UserBloc>(context).add(
          ActivateUser(
            User(
              id: 1,
              name: myController.text,
              activities: [1, 2, 3],
            ),
          ),
        );
        Navigator.pushReplacementNamed(context, '/home');
      },
    );
  }
}
