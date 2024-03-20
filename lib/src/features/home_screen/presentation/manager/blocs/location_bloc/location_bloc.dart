// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:my_freends/src/features/home_screen/data/models/location_model/location_model.dart';
import 'package:my_freends/src/features/home_screen/domain/repositories/location_repositories/location_repositories.dart.dart';
import 'package:my_freends/src/features/home_screen/domain/service/map_service/yandex_map_service/yandex_map_service.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepositories locationRepositories;
  LocationBloc({required this.locationRepositories})
      : super(LocationInitial()) {
    on<GetLocationEvent>((event, emit) async {
      emit(LocationLoading());
      try {
        final model = await locationRepositories.getLocation(
            appLatLong: event.appLatLong);
        emit(LocationSuccess(model: model));
      } catch (e) {
        if (e is DioException) {
          emit(LocationError(errorText: e.response?.data.toString() ?? ""));
        } else {
          emit(LocationError(errorText: e.toString()));
        }
      }
    });
    on<GetLocationByAddressEvent>((event, emit) async {
      emit(LocationLoading());
      try {
        final model = await locationRepositories.getLocationByAddress(
            houseNumber: event.houseNumber, street: event.street);
        emit(LocationSuccess(model: model));
      } catch (e) {
        if (e is DioException) {
          emit(LocationError(errorText: e.response?.data.toString() ?? ""));
        } else {
          emit(LocationError(errorText: e.toString()));
        }
      }
    });
  }
}
