// ignore_for_file: unnecessary_new, prefer_const_constructors, unnecessary_string_interpolations, avoid_print

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eda_mphs_dashboard/widget/charts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
String? selectedValue;

final String currentTime = getSystemTime();

String getSystemTime() {
  var now = new DateTime.now();
  return new DateFormat("HH:mm:ss a").format(now);
}

class PanelCenterScreen extends StatefulWidget {
  const PanelCenterScreen({super.key});

  @override
  State<PanelCenterScreen> createState() => _PanelCenterScreenState();
}

class _PanelCenterScreenState extends State<PanelCenterScreen> {
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
                    'Select Item 3',
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
                    width: 420,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 410, // Set the desired width
                height: 50, // Set the desired height
                color: Colors.amberAccent,
                child: TimerBuilder.periodic(Duration(seconds: 1),
                    builder: (context) {
                  print("${getSystemTime()}");
                  return Text(
                    "${getSystemTime()}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const LineChartSample1(),
          const LineChartSample2()
        ],
      ),
    );
  }
}
