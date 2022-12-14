import 'dart:convert';
import 'dart:io';

class EnvUtil {
  static String get env => '.env';

  /// This method will read from .env that located on the server/ root directory
  static Future<Map<dynamic, dynamic>> readEnv() async {
    /// First read the file string
    final contents = await File(env).readAsString();
    final ls = LineSplitter();

    /// Then split by line and sanitize if there is any abstract line of code
    /// that doesnt using key = value format
    final configs = ls.convert(contents);
    final sanitizedConfigs = configs.where(
      (config) => config.contains('='),
    );

    /// Then construct from list of string into map, then into Env class
    final result = {};
    for (var c in sanitizedConfigs) {
      final separatorIndex = c.indexOf("=");
      final newC = [
        c.substring(0, separatorIndex).trim(),
        c.substring(separatorIndex + 1).trim()
      ];
      result[newC.first] = newC.last;
    }
    return result;
  }
}
