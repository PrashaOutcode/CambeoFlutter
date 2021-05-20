import 'package:flutter/material.dart';

import 'appRoutes/AppRoutes.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: AppRoutes().appRoutes,
      /*    theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,*/
    ));
