import 'package:flutter/material.dart';

import 'package:timtrack/pages/activities_page.dart';
import 'package:timtrack/pages/home_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (_) => HomePage(),
  '/activities': (_) => ActivitiesPage(),
};
