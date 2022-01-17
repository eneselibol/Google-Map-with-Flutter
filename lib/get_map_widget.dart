import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';

Widget getMap() {
  //Div Öğesini adlandırmak için benzersiz bir Id, kimlik oluşturuyoruz.
  String htmlId = "6";
  //Burdan Sonra Map Görüntüsünü Oluşturmaya Başlıyoruz.
  //ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
    final latLang = LatLng(41.02699920651806, 28.97406463801715);

    final mapOptions = MapOptions()
      ..zoom = 15 // Map Zoom Oranı
      ..tilt = 150
      ..center = latLang;
    final elem = DivElement()
      ..id = htmlId //Div Id
      ..style.width = "100%" // Div Genişlik
      ..style.height = "100%" // Div Yükseklik
      ..style.border = "none"; // Div Kenarlık

    final map = GMap(elem, mapOptions);
    Marker(MarkerOptions()
      ..position = latLang
      ..map = map
      ..title = 'My position');
    return elem;
  });

  //Flutter Web için bir platform görünümü oluşturur.
  return HtmlElementView(
    viewType: htmlId,
  );
}
