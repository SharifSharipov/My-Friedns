part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSuccess extends LocationState {
  final LocationModel model;
  LocationSuccess({required this.model});
}

final class LocationError extends LocationState {
  final String errorText;
  LocationError({required this.errorText});
}
