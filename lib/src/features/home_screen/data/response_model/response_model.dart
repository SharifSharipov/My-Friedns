import '../models/location_model/location_geo_object_collection.dart';
class Response {
  final GeoObjectCollection geoObjectCollection;
  Response copyWith({GeoObjectCollection? geoObjectCollection}) {
    return Response(
        geoObjectCollection: geoObjectCollection ?? this.geoObjectCollection);
  }

  Response({
    required this.geoObjectCollection,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        geoObjectCollection:
            GeoObjectCollection.fromJson(json["GeoObjectCollection"]),
      );

  Map<String, dynamic> toJson() => {
        "GeoObjectCollection": geoObjectCollection.toJson(),
      };
}
