import 'package:chuva/app/core/enviroment/enviroment.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class RestClient extends DioForNative {
  RestClient()
      : super(BaseOptions(
          baseUrl: Enviroment.apiUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 60),
        ));
}
