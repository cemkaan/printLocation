import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  LocationsApi.getGameLocations().then((value) => value.forEach((element) {
        print(element.id);
      }));
}

class Location {
  final int id;

  const Location({this.id});

  static Location fromJson(json) => Location(
        id: json['id'],
      );
}

class LocationsApi {
  static Future<List> getGameLocations() async {
    final url = Uri.parse('https://api.jsonbin.io/b/606b477a8be464182c592d16');
    // Uri.parse('https://api.jsonbin.io/v3/b/606b477a8be464182c592d16');
    final response = await http.get(url);
    final body = json.decode(response.body);
    // final body = json.decode(response.body).record;
    return body.map<Location>(Location.fromJson).toList();
  }
}
