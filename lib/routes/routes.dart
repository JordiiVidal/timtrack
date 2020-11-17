import 'package:flutter/material.dart';

import 'package:timtrack/pages/activity_edit_page.dart';
import 'package:timtrack/pages/home_page.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (_) => HomePage(),
  '/editActivity': (_) => ActivityEditPage(),
};
