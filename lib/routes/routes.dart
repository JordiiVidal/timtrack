import 'package:flutter/material.dart';
import 'package:timtrack/pages/activity/activity_page.dart';
import 'package:timtrack/pages/activity/addactivity_page.dart';

import 'package:timtrack/pages/home_page.dart';
import 'package:timtrack/pages/loading_page.dart';
import 'package:timtrack/pages/profile_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (_) => HomePage(),
  '/loading': (_) => LoadingPage(),
  '/activity': (_) => ActivityPage(),
  '/profile': (_) => ProfilePage(),
  '/addActivity' : (_) => AddActivityPage(),
};
