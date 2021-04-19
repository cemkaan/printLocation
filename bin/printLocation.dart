import 'dart:convert';
import 'game_location.dart';
import 'package:http/http.dart' as http;

void main() {
  LocationsApi.getGameLocations().then((gl) => {
        gl.record.forEach((element) {
          print(element.isim);
        })
      });
}

class LocationsApi {
  static Future<GameLocation> getGameLocations() async {
    final url =
        Uri.parse('https://api.jsonbin.io/v3/b/606b477a8be464182c592d16');
    final response = await http.get(url);
    final body = await json.decode(response.body);

    return GameLocation.fromJson(body);
  }
}
