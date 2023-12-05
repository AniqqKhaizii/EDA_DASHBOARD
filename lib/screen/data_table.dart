// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations
import 'package:eda_mphs_dashboard/resource/get_data.dart';
import 'package:flutter/material.dart';

class MphsData extends StatefulWidget {
  const MphsData({super.key});

  @override
  State<MphsData> createState() => _MphsDataState();
}

class _MphsDataState extends State<MphsData> {
  List<KompaunData> kompaunData = [];

  @override
  void initState() {
    super.initState();
    KompaunData.fetchAll().then((data) {
      setState(() {
        kompaunData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kompaun Data Table'),
      ),
      body: FutureBuilder<List<KompaunData>>(
        future: KompaunData.fetchAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return DataTable(
            columns: [
              DataColumn(
                  label: Text('KOMPAUN NOMBOR',
                      style: TextStyle(color: Colors.white, fontSize: 14))),
              DataColumn(
                  label: Text('KOMPAUN TARIKH',
                      style: TextStyle(color: Colors.white, fontSize: 14))),
              DataColumn(
                  label: Text('KOMPAUN MASA',
                      style: TextStyle(color: Colors.white, fontSize: 14))),
              DataColumn(
                  label: Text('KOMPAUN AMAUN',
                      style: TextStyle(color: Colors.white, fontSize: 14))),
              DataColumn(
                  label: Text('KOMPAUN STATUS',
                      style: TextStyle(color: Colors.white, fontSize: 14))),
              DataColumn(
                  label: Text('KOMPAUN NAMA ORANG',
                      style: TextStyle(color: Colors.white, fontSize: 14))),
              DataColumn(
                  label: Text('KOMPAUN NAMA PERNIAGAAN',
                      style: TextStyle(color: Colors.white, fontSize: 14))),
              DataColumn(
                  label: Text('TEMPAT',
                      style: TextStyle(color: Colors.white, fontSize: 14))),
            ],
            rows: snapshot.data!
                .map(
                  (kompaunData) => DataRow(
                    cells: [
                      DataCell(Text('${kompaunData.KOMPAUN_NOMBOR}',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                      DataCell(Text('${kompaunData.KOMPAUN_TARIKH}',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                      DataCell(Text('${kompaunData.KOMPAUN_MASA}',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                      DataCell(Text('${kompaunData.KOMPAUN_AMAUN.toString()}',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                      DataCell(Text('${kompaunData.KOMPAUN_STATUS}',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                      DataCell(Text('${kompaunData.KOMPAUN_NAMA_ORANG}',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                      DataCell(Text('${kompaunData.KOMPAUN_NAMA_PERNIAGAAN}',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                      DataCell(Text('${kompaunData.TEMPAT}',
                          style: TextStyle(color: Colors.white, fontSize: 10))),
                    ],
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
