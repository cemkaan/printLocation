class GameLocation {
  List<Record> record;
  Metadata metadata;

  GameLocation({this.record, this.metadata});

  GameLocation.fromJson(Map<String, dynamic> json) {
    if (json['record'] != null) {
      record = <Record>[];
      json['record'].forEach((v) {
        record.add(Record.fromJson(v));
      });
    }
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (record != null) {
      data['record'] = record.map((v) => v.toJson()).toList();
    }
    if (metadata != null) {
      data['metadata'] = metadata.toJson();
    }
    return data;
  }
}

class Record {
  int id;
  String isim;
  String tarif;
  String ipucu;
  double enlem;
  double boylam;
  int pazaraM;

  Record(
      {this.id,
      this.isim,
      this.tarif,
      this.ipucu,
      this.enlem,
      this.boylam,
      this.pazaraM});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isim = json['isim'];
    tarif = json['tarif'];
    ipucu = json['ipucu'];
    enlem = json['enlem'];
    boylam = json['boylam'];
    pazaraM = json['pazara_m'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['isim'] = isim;
    data['tarif'] = tarif;
    data['ipucu'] = ipucu;
    data['enlem'] = enlem;
    data['boylam'] = boylam;
    data['pazara_m'] = pazaraM;
    return data;
  }
}

class Metadata {
  String id;
  bool private;

  Metadata({this.id, this.private});

  Metadata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    private = json['private'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['private'] = private;
    return data;
  }
}
