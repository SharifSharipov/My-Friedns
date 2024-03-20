import 'location_model.dart';

class MetaDataProperty {
  GeocoderResponseMetaData? geocoderResponseMetaData;

  MetaDataProperty({this.geocoderResponseMetaData});

  MetaDataProperty.fromJson(Map<String, dynamic> json) {
    geocoderResponseMetaData = json['GeocoderResponseMetaData'] != null
        ?  GeocoderResponseMetaData.fromJson(
            json['GeocoderResponseMetaData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.geocoderResponseMetaData != null) {
      data['GeocoderResponseMetaData'] =
          this.geocoderResponseMetaData!.toJson();
    }
    return data;
  }
}