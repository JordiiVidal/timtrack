import 'package:flutter/material.dart';
import 'package:timtrack/pages/activity_page.dart';

import 'package:timtrack/pages/home_page.dart';
import 'package:timtrack/pages/profile_page.dart';
import 'package:timtrack/pages/signup_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/': (_) => SignUpPage(),
  '/home': (_) => HomePage(),
  '/activity': (_) => ActivityPage(),
  '/profile': (_) => ProfilePage(),
};
