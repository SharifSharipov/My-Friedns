import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:my_freends/src/features/home_screen/data/models/email_model/email_model.dart';
import 'package:my_freends/src/features/home_screen/domain/repositories/order_repositories/order_repositories.dart';
part 'order_bloc_event.dart';
part 'order_bloc_state.dart';

class OrderBloc extends Bloc<OrderBlocEvent, OrderBlocState> {
  final OrderRepository orderRepository;
  OrderBloc({required this.orderRepository}) : super(OrderBlocInitial()) {
    on<SendOrderBlocEvent>((event, emit) async {
      emit(OrderLoading());
      try {
        orderRepository.sendEmail(emailModel: event.emailModel);
        emit(OrderSuccess());
      } catch (e) {
        if (e is DioException) {
          emit(OrderError(erroText: e.response?.data.toString() ?? ""));
        } else {
          emit(OrderError(erroText: e.toString()));
        }
      }
    });
  }
}
