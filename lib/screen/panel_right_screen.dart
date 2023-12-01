import 'package:flutter/material.dart';

import '../resource/app_colors.dart';
import '../resource/app_padding.dart';
import '../widget/charts.dart';

class Product {
  String name;
  bool enable;
  Product({this.enable = true, required this.name});
}

class PanelRightScreen extends StatefulWidget {
  const PanelRightScreen({super.key});

  @override
  State<PanelRightScreen> createState() => _PanelRightScreenState();
}

class _PanelRightScreenState extends State<PanelRightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
                left: AppPadding.P10 / 2,
                top: AppPadding.P10 / 2,
                right: AppPadding.P10 / 2),
            child: Card(
              color: AppColors.purpleLight,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const SizedBox(
                width: double.infinity,
                child: ListTile(
                  title: Text(
                    "Net Revenue",
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "7% of Sales Avg.",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Chip(
                    label: Text(
                      r"$46,450",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const LineChartSample1(),
        ]),
      ),
    );
  }
}
