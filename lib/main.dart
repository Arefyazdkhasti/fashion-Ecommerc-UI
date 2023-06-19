import 'package:fashion_ecommerce/ui/light_theme_color.dart';
import 'package:fashion_ecommerce/ui/root/root_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static  const defaultTextStyle = TextStyle(
        color: LightThemeColor.primaryTextColor,
        fontFamily: 'Lotus',
        fontSize: 18);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        textTheme: TextTheme(
            bodyMedium: defaultTextStyle,
            bodySmall: defaultTextStyle.apply(
                color: LightThemeColor.secondaryTextColor),
            titleLarge: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
            titleMedium: defaultTextStyle,
            labelMedium: defaultTextStyle),
        colorScheme: const ColorScheme.light(
            background: LightThemeColor.backgroundColor,
            primary: LightThemeColor.primaryColor,
            secondary: LightThemeColor.secondaryColor,
            onSecondary: Colors.white),
            useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: const RootScreen(),

    );
  }
}
