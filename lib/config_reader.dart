import 'dart:convert';
import 'package:flutter/services.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config;

  static Future<void> initialise() async {
    final configString = await rootBundle.loadString("config/app_config.json");
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getNewsAPIKey() {
    return _config["NEWS_API_KEY"] as String;
  }

  static String getCovidSaAPIKey() {
    return _config["COVID_API_KEY"] as String;
  }
}
