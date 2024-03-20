import 'package:dio/dio.dart';
import 'package:my_freends/src/core/constants/app_constants.dart';
import 'package:my_freends/src/features/home_screen/domain/service/map_service/yandex_map_service/yandex_map_service.dart';
import '../../../data/models/location_model/location_model.dart';

class LocationRepositories {
  final Dio dio;
  LocationRepositories({required this.dio});

  Future<LocationModel> getLocation({
    required AppLatLong appLatLong,
  }) async {
    final response = await dio.get(
      "https://geocode-maps.yandex.ru/1.x/?apikey=${AppConsts.apiKey}&geocode=${appLatLong.lat},${appLatLong.long}&format=json",
    );
    return LocationModel.fromJson(response.data);
  }

  Future<LocationModel> getLocationByAddress(
      {required String street, required String houseNumber}) async {
    final response = await dio.get(
        "https://geocode-maps.yandex.ru/1.x/?apikey=${AppConsts.apiKey}&geocode=Ташкент,+$street+улица,+дом+$houseNumber&format=json");
    return LocationModel.fromJson(response.data);
  }
}
