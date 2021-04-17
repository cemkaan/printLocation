import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  LocationsApi.getGameLocations().then((value) => print(value.last));
}

class Location {
  final int id;
  final String isim;
  final String tarif;
  final String ipucu;
  final double enlem;
  final double boylam;
  final int pazaraM;

  const Location(
      {this.id,
      this.isim,
      this.tarif,
      this.ipucu,
      this.enlem,
      this.boylam,
      this.pazaraM});

  static Location fromJson(json) => Location(
        id: json['id'],
        isim: json['isim'],
        tarif: json['tarif'],
        ipucu: json['ipucu'],
        enlem: json['enlem'],
        boylam: json['boylam'],
        pazaraM: json['pazara_m'],
      );
}

class LocationsApi {
  static Future<List> getGameLocations() async {
    final url =
        Uri.parse('https://api.jsonbin.io/v3/b/606b477a8be464182c592d16');
    final response = await http.get(url);
    final body = json.decode(response.body);
    return body.map<Location>(Location.fromJson).toList();
  }
}
