import 'location_model.dart';

class Locality {
  String? localityName;
  Thoroughfare? thoroughfare;

  Locality({this.localityName, this.thoroughfare});

  Locality.fromJson(Map<String, dynamic> json) {
    localityName = json['LocalityName'];
    thoroughfare = json['Thoroughfare'] != null
        ? Thoroughfare.fromJson(json['Thoroughfare'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['LocalityName'] = this.localityName;
    if (this.thoroughfare != null) {
      data['Thoroughfare'] = this.thoroughfare!.toJson();
    }
    return data;
  }
}