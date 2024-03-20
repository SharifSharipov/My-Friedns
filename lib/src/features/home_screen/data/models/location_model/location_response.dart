import 'location_geo_object_collection.dart';
class Response {
  GeoObjectCollection? geoObjectCollection;

  Response({this.geoObjectCollection});

  Response.fromJson(Map<String, dynamic> json) {
    geoObjectCollection = json['GeoObjectCollection'] != null
        ?  GeoObjectCollection.fromJson(json['GeoObjectCollection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (geoObjectCollection != null) {
      data['GeoObjectCollection'] = geoObjectCollection!.toJson();
    }
    return data;
  }
}
