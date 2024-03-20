import 'package:dio/dio.dart';
import 'package:my_freends/src/features/home_screen/data/models/email_model/email_model.dart';

class OrderRepository {
  final Dio dio;
  OrderRepository({required this.dio});
  Future<void> sendEmail({required EmailModel emailModel}) async {
    await dio.post("https://api.emailjs.com/api/v1.0/email/send", data: {
      "service_id": "service_pfb3ir9",
      "template_id": "template_bt9ka3a",
      "user_id": "zXdQN_32ybYwmWZPp",
      "accessToken": "vu1yD1MCOlD1W8PEbwzF4",
      "template_params": emailModel.toJson(),
    });
  }
}
