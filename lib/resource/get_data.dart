// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KompaunData {
  final String KOMPAUN_NOMBOR;
  final String KOMPAUN_TARIKH;
  final String KOMPAUN_MASA;
  final String KOMPAUN_AMAUN;
  final String KOMPAUN_STATUS;
  final String KOMPAUN_NAMA_ORANG;
  final String KOMPAUN_NAMA_PERNIAGAAN;
  final String TEMPAT;
  final String KESALAHAN_UNDANG2;
  final String KESALAHAN_PERUNTUKAN;
  final String KESALAHAN_KETERANGAN;
  final String PINDAAN_TARIKH;
  final String PINDAAN_TINDAKAN;
  final String PINDAAN_KETERANGAN;
  final String KOMPAUN_AMAUN_LAMA;
  final String BAYARAN_AMAUN;
  final String BAYARAN_TARIKH;
  final String BAYARAN_SALURAN;
  final String BAYARAN_STATUS;
  final String BAYARAN_BOLEH;
  final String TEMPAT_GPS_LONGTITUDE;
  final String TEMPAT_GPS_LATITUDE;
  final String TEMPAT_ZON_NAMA;
  final String TEMPAT_KAWASAN_NAMA;
  final String PERNIAGAAN;
  final String BULAN_NOMBOR;
  final String TAHUN;
  final String STATUS_TINDAKAN;
  final String KESALAHAN;

  KompaunData(
      {required this.KOMPAUN_NOMBOR,
      required this.KOMPAUN_TARIKH,
      required this.KOMPAUN_MASA,
      required this.KOMPAUN_AMAUN,
      required this.KOMPAUN_STATUS,
      required this.KOMPAUN_NAMA_ORANG,
      required this.KOMPAUN_NAMA_PERNIAGAAN,
      required this.TEMPAT,
      required this.KESALAHAN_UNDANG2,
      required this.KESALAHAN_PERUNTUKAN,
      required this.KESALAHAN_KETERANGAN,
      required this.PINDAAN_TARIKH,
      required this.PINDAAN_TINDAKAN,
      required this.PINDAAN_KETERANGAN,
      required this.KOMPAUN_AMAUN_LAMA,
      required this.BAYARAN_AMAUN,
      required this.BAYARAN_TARIKH,
      required this.BAYARAN_SALURAN,
      required this.BAYARAN_STATUS,
      required this.BAYARAN_BOLEH,
      required this.TEMPAT_GPS_LONGTITUDE,
      required this.TEMPAT_GPS_LATITUDE,
      required this.TEMPAT_ZON_NAMA,
      required this.TEMPAT_KAWASAN_NAMA,
      required this.PERNIAGAAN,
      required this.BULAN_NOMBOR,
      required this.TAHUN,
      required this.STATUS_TINDAKAN,
      required this.KESALAHAN});

  factory KompaunData.fromJason(Map<String, dynamic> json) {
    return KompaunData(
        KOMPAUN_NOMBOR: json['KOMPAUN_NOMBOR'],
        KOMPAUN_TARIKH: json['KOMPAUN_TARIKH'],
        KOMPAUN_MASA: json['KOMPAUN_MASA'],
        KOMPAUN_AMAUN: json['KOMPAUN_AMAUN'],
        KOMPAUN_STATUS: json['KOMPAUN_STATUS'],
        KOMPAUN_NAMA_ORANG: json['KOMPAUN_NAMA_ORANG'],
        KOMPAUN_NAMA_PERNIAGAAN: json['KOMPAUN_NAMA_PERNIAGAAN'],
        TEMPAT: json['TEMPAT'],
        KESALAHAN_UNDANG2: json['KESALAHAN_UNDANG2'],
        KESALAHAN_PERUNTUKAN: json['KESALAHAN_PERUNTUKAN'],
        KESALAHAN_KETERANGAN: json['KESALAHAN_KETERANGAN'],
        PINDAAN_TARIKH: json['PINDAAN_TARIKH'],
        PINDAAN_TINDAKAN: json['PINDAAN_TINDAKAN'],
        PINDAAN_KETERANGAN: json['PINDAAN_KETERANGAN'],
        KOMPAUN_AMAUN_LAMA: json['KOMPAUN_AMAUN_LAMA'],
        BAYARAN_AMAUN: json['BAYARAN_AMAUN'],
        BAYARAN_TARIKH: json['BAYARAN_TARIKH'],
        BAYARAN_SALURAN: json['BAYARAN_SALURAN'],
        BAYARAN_STATUS: json['BAYARAN_STATUS'],
        BAYARAN_BOLEH: json['BAYARAN_BOLEH'],
        TEMPAT_GPS_LONGTITUDE: json['TEMPAT_GPS_LONGTITUDE'],
        TEMPAT_GPS_LATITUDE: json['TEMPAT_GPS_LATITUDE'],
        TEMPAT_ZON_NAMA: json['TEMPAT_ZON_NAMA'],
        TEMPAT_KAWASAN_NAMA: json['TEMPAT_KAWASAN_NAMA'],
        PERNIAGAAN: json['PERNIAGAAN'],
        BULAN_NOMBOR: json['BULAN_NOMBOR'],
        TAHUN: json['TAHUN'],
        STATUS_TINDAKAN: json['STATUS_TINDAKAN'],
        KESALAHAN: json['KESALAHAN']);
  }

  static Future<List<KompaunData>> fetchAll() async {
    final response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbwZy8_KM4VRXye9vFqO3xOK8FxKQv1_Gdfv-BTyPSZaKMF2nZxh6_zjpfb4lwcUHOMw/exec'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => KompaunData.fromJason(data)).toList();
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }
}
