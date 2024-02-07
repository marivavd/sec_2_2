import 'package:flutter/material.dart';


var lightheme = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      color: Color.fromARGB(255, 58, 58, 58),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 167, 167, 167),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 14
    ),
    titleMedium: TextStyle(
        fontSize: 12,
        fontFamily: 'Roboto',
        color: Color.fromARGB(255, 167, 167, 167)
    ),
    labelMedium: TextStyle(
        color: Color.fromARGB(255, 5, 96, 250),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 5, 96, 250),
        disabledBackgroundColor: Color.fromARGB(255, 167, 167, 167),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        )
    ),
  )
);
var darktheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 24,
          color: Color.fromARGB(255, 58, 58, 58),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500
      ),
      titleSmall: TextStyle(
          color: Color.fromARGB(255, 167, 167, 167),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 14
      ),
      titleMedium: TextStyle(
          fontSize: 12,
          fontFamily: 'Roboto',
          color: Color.fromARGB(255, 167, 167, 167)
      ),
      labelMedium: TextStyle(
          color: Color.fromARGB(255, 5, 96, 250),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 14
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 5, 96, 250),
          disabledBackgroundColor: Color.fromARGB(255, 167, 167, 167),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)
          )
      ),
    )
);