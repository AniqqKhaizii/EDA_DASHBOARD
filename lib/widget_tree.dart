import 'package:eda_mphs_dashboard/screen/data_table.dart';
import 'package:flutter/material.dart';
import 'package:eda_mphs_dashboard/widget/responsive_layout.dart';
import 'screen/panel_left_screen.dart';
import 'screen/panel_right_screen.dart';
import 'screen/panel_center_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 57, 29, 199),
            ),
            body: ResponsiveLayout(
                tiny: Container(),
                phone: currentIndex == 0
                    ? const PanelLeftScreen()
                    : currentIndex == 1
                        ? const PanelCenterScreen()
                        : const PanelRightScreen(),
                tablet: const Row(
                  children: [
                    Expanded(child: PanelLeftScreen()),
                    Expanded(child: PanelRightScreen())
                  ],
                ),
                largeTablet: const Row(
                  children: [
                    Expanded(child: PanelLeftScreen()),
                    Expanded(child: PanelCenterScreen()),
                    Expanded(child: PanelRightScreen())
                  ],
                ),
                computer: MphsData())));
  }
}
