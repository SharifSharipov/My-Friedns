part of 'order_bloc_bloc.dart';

sealed class OrderBlocState {}

final class OrderBlocInitial extends OrderBlocState {}

final class OrderSuccess extends OrderBlocState {}

final class OrderError extends OrderBlocState {
  final String erroText;
  OrderError({required this.erroText});
}

final class OrderLoading extends OrderBlocState {}
