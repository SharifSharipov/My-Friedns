part of 'order_bloc_bloc.dart';

sealed class OrderBlocEvent {}

final class SendOrderBlocEvent extends OrderBlocEvent {
  final EmailModel emailModel;
  SendOrderBlocEvent({required this.emailModel});
}
