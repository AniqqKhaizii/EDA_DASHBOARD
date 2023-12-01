import 'dart:html';
import 'dart:ui' as ui;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eda_mphs_dashboard/widget/charts.dart';
import 'package:flutter/material.dart';

class PanelCenterScreen extends StatefulWidget {
  const PanelCenterScreen({super.key});

  @override
  State<PanelCenterScreen> createState() => _PanelCenterScreenState();
}

class _PanelCenterScreenState extends State<PanelCenterScreen> {
  final IFrameElement _iFrameElement = IFrameElement();

  @override
  void initState() {
    _iFrameElement.style.height = '50%';
    _iFrameElement.style.width = '50%';
    _iFrameElement.src =
        'https://free.timeanddate.com/clock/i92b560r/n122/tlmy40/fn16/fs20/tct/pct/ftb/pd2/th2';
    _iFrameElement.style.border = 'none';

    //ignore: undefined_prefixed_name
    ui.plateformViewRegistry
        .registerViewFactory('iFrameElement', (int ViewId) => _iFrameElement);

    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

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
                    width: 300,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 530, // Set the desired width
                height: 50, // Set the desired height
                color: Colors.amberAccent,
                child: _iframeWidget,
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
