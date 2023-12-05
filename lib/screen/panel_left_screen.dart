// ignore_for_file: sized_box_for_whitespace

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eda_mphs_dashboard/widget/bar_chat.dart';
import 'package:flutter/material.dart';
import 'package:eda_mphs_dashboard/resource/app_colors.dart';

import '../widget/pie_chart.dart';

final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
String? selectedValue;

class PanelLeftScreen extends StatefulWidget {
  const PanelLeftScreen({super.key});

  @override
  State<PanelLeftScreen> createState() => _PanelLeftScreenState();
}

class _PanelLeftScreenState extends State<PanelLeftScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text(
                    'Select Item 1',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    width: 525,
                  ),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text(
                    'Select Item 2',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    width: 525,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 150,
            child: ListView(
              // This next line does the trick.
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 206,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 206,
                  color: Colors.green,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 206,
                  color: Colors.red,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 206,
                  color: Colors.pinkAccent,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 206,
                  color: Colors.purpleAccent,
                ),
              ],
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              // This next line does the trick.
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 206,
                  color: Colors.blue,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 206,
                  color: Colors.green,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 206,
                  color: Colors.red,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 206,
                  color: Colors.pinkAccent,
                ),
                const SizedBox(width: 10),
                Container(
                  width: 206,
                  color: Colors.purpleAccent,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: 530, // Set the desired width
                height: 510, // Set the desired height
                color: AppColors.purpleLight, // Set the desired color
                child: const PieChartSample2(), // Your content goes here
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: 530, // Set the desired width
                height: 510, // Set the desired height
                color: AppColors.purpleLight, // Set the desired color
                child: BarChartSample2(),
              )
            ],
          )
        ],
      ),
    );
  }
}
