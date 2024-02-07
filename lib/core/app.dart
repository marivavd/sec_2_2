import 'package:flutter/material.dart';
import 'package:sec_2_2/core/theme.dart';

import '../auth/presentation/pages/sign_up_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: darktheme,
      theme: lightheme,
      home: const Sign_up_Page(),
    );
  }
}