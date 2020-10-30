import 'package:flutter/material.dart';

import 'package:timtrack/widgets/signup/activities_grid_sign.dart';
import 'package:timtrack/widgets/signup/background_sign.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackgroundSign(
            size: size,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 18.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    'TIMTRACK',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      ActivitiesGridSign(),
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
        ],
      ),
    );
  }

  Widget buttonSignUp(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16.0,
      ),
      child: RaisedButton(
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
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
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
        onPressed: () async {
          Navigator.pushReplacementNamed(context, '/home');
        },
      ),
    );
  }
}
