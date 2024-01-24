import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocalData.EN),
  MapLocale("ru", LocalData.RU),
  MapLocale("uz", LocalData.UZ),
];

mixin LocalData {
  static const String title = "title";
  static const String body = "body";

  static const Map<String, dynamic> EN = {
    title: "Language: ",
    body: "Choose language",
  };
  static const Map<String, dynamic> RU = {
    title: "язык: ",
    body: "выберите язык",
  };
  static const Map<String, dynamic> UZ = {
    title: "Til: ",
    body: "Tilni tanlang",
  };
}