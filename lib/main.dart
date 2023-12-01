import 'package:eda_mphs_dashboard/widget_tree.dart';
import 'package:flutter/material.dart';
import 'resource/app_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MPHS DASHBOARD',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 14, 13, 13),
          primarySwatch: Colors.blue,
          canvasColor: AppColors.purpleLight),
      home: const WidgetTree(),
    );
  }
}
