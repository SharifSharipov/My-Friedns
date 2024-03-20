part of 'location_bloc.dart';

@immutable
sealed class LocationEvent {}

class GetLocationEvent extends LocationEvent {
  final AppLatLong appLatLong;
  GetLocationEvent({required this.appLatLong});
}

class GetLocationByAddressEvent extends LocationEvent {
  final String street;
  final String houseNumber;
  GetLocationByAddressEvent({required this.street,required this.houseNumber});
}
